// Copyright (C) 2011-2012 R M Yorston
// Licence: GPLv2+

const Lang = imports.lang;

const DBus = imports.dbus;
const St = imports.gi.St;

const Clutter = imports.gi.Clutter;
const EndSessionDialog = imports.ui.endSessionDialog;
const Main = imports.ui.main;
const UserMenu = imports.ui.userMenu;

const _f = imports.gettext.domain('frippery-shut-down-menu').gettext;

let usermenu = null;
let updateSuspendOrPowerOff;
let fakeUpdateSuspendOrPowerOff;
let originalDialogContent;

function init(extensionMeta) {
    let localePath = extensionMeta.path + '/locale';
    imports.gettext.bindtextdomain('frippery-shut-down-menu', localePath);

    usermenu = Main.panel._statusArea['userMenu'];

    if ( !usermenu ) {
        return;
    }

    updateSuspendOrPowerOff = usermenu._updateSuspendOrPowerOff;
    originalDialogContent = EndSessionDialog.DialogContent[1];

    fakeUpdateSuspendOrPowerOff = function() {
        this._haveSuspend = false;
        this._suspendOrPowerOffItem.updateText(_f("Shut Down..."), null);
    }

    EndSessionDialog.EndSessionDialog.prototype._onHibernate = function() {
        this._stopTimer();
        DBus.session.emit_signal('/org/gnome/SessionManager/EndSessionDialog',
                                 'org.gnome.SessionManager.EndSessionDialog',
                                 'Canceled', '', []);
        this.close(global.get_current_time());

        this._screenSaverProxy.LockRemote(Lang.bind(this, function() {
            this._upClient.hibernate_sync(null);
        }));
    };

    EndSessionDialog.EndSessionDialog.prototype._onSuspend = function() {
        this._stopTimer();
        DBus.session.emit_signal('/org/gnome/SessionManager/EndSessionDialog',
                                 'org.gnome.SessionManager.EndSessionDialog',
                                 'Canceled', '', []);
        this.close(global.get_current_time());

        this._screenSaverProxy.LockRemote(Lang.bind(this, function() {
            this._upClient.suspend_sync(null);
        }));
    };

    EndSessionDialog.EndSessionDialog.prototype._updateButtons = function() {
        let dialogContent = EndSessionDialog.DialogContent[this._type];
        let buttons = [];
        let usermenu = Main.panel._statusArea['userMenu'];
        this._upClient = usermenu._upClient;
        this._screenSaverProxy = usermenu._screenSaverProxy;

        if ( dialogContent.secondaryButtons ) {
            for (let i = 0; i < dialogContent.secondaryButtons.length; i++) {
                let signal = dialogContent.secondaryButtons[i].signal;
                let label = dialogContent.secondaryButtons[i].label;

                if ( signal == 'ConfirmedHibernate' ) {
                    if ( this._upClient && this._upClient.get_can_hibernate() ) {
                        buttons.push({ action: Lang.bind(this, this._onHibernate),
                                       label: label });
                    }
                }
                else if ( signal == 'ConfirmedSuspend' ) {
                    if ( this._upClient && this._upClient.get_can_suspend() ) {
                        buttons.push({ action: Lang.bind(this, this._onSuspend),
                                       label: label });
                    }
                }
                else {
                    buttons.push({ action: Lang.bind(this, function() {
                                           this._confirm(signal);
                                       }),
                                   label: label });
                }
            }
        }

        buttons.push({ action: Lang.bind(this, this.cancel),
                         label:  _("Cancel"),
                         key:    Clutter.Escape });

        for (let i = 0; i < dialogContent.confirmButtons.length; i++) {
            let signal = dialogContent.confirmButtons[i].signal;
            let label = dialogContent.confirmButtons[i].label;
            buttons.push({ action: Lang.bind(this, function() {
                                       this._confirm(signal);
                                   }),
                           label: label });
        }

        this.setButtons(buttons);
    };
}

function enable() {
    const shutdownDialogContent = {
        subject: C_("title", "Power Off"),
        inhibitedDescription: _("Click Power Off to quit these applications and power off the system."),
        uninhibitedDescription: function(seconds) {
            return ngettext("The system will power off automatically in %d second.",
                            "The system will power off automatically in %d seconds.",
                            seconds).format(seconds);
        },
        endDescription: _("Powering off the system."),
        secondaryButtons: [{ signal: 'ConfirmedSuspend',
                           label:  _("Suspend") },
                         { signal: 'ConfirmedHibernate',
                           label:  _f("Hibernate") },
                         { signal: 'ConfirmedReboot',
                           label:  C_("button", "Restart") }],
        confirmButtons: [{ signal: 'ConfirmedShutdown',
                           label:  C_("button", "Power Off") }],
        iconName: 'system-shutdown',
        iconStyleClass: 'end-session-dialog-shutdown-icon'
    };

    if ( usermenu ) {
        usermenu._updateSuspendOrPowerOff = fakeUpdateSuspendOrPowerOff;
        EndSessionDialog.DialogContent[1] = shutdownDialogContent;
        usermenu._updateSuspendOrPowerOff();
    }
}

function disable() {
    if ( usermenu ) {
        usermenu._updateSuspendOrPowerOff = updateSuspendOrPowerOff;
        EndSessionDialog.DialogContent[1] = originalDialogContent;
        usermenu._updateSuspendOrPowerOff();
    }
}
