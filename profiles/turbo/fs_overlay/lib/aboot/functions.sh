#====================================== Variables =======================================#

_r="\033[00;31m"
_y="\033[00;33m"
_g="\033[00;32m"
_b="\033[00;34m"
_B="\033[01;34m"
_W="\033[01;37m"
_n="\033[00;0m"


#================================== Messages functions ==================================#

# Colorized messages
_info() {
    echo -e "${_B}:: ${_W}${1}${_n}"
}

_info2() {
    echo -e "${_B}:: ${_W}${1}: ${_B}${2}${_n}"
}

_warn() {
    echo -e "${_y}WARNING: ${_W}${1}${_n}"
}

_warn2() {
    echo -e "${_y}WARNING: ${_W}${1}: ${_y}${2}${_n}"
}

_error() {
    echo -e "${_r}ERROR: ${_W}${1}${_n}"
    _info "Launching interactive shell for repairs"
    launch_interactive_shell
}

_error2() {
    echo -e "${_r}ERROR: ${_W}${1}: ${_r}${2}${_n}"
    _info "Launching interactive shell for repairs"
    launch_interactive_shell
}

_title() {
    echo -e "\n ${_B}> ${_W}${1}${_n}\n"
}


# Messages without colors
_info_n() {
    echo -e ":: ${1}"
}

_info2_n() {
    echo -e ":: ${1}: ${2}"
}

_warn_n() {
    echo -e "}WARNING: ${1}"
}

_warn2_n() {
    echo -e "WARNING: ${1}: ${2}"
}

_error_n() {
    echo -e "ERROR: ${1}"
    _info "Launching interactive shell for repairs"
    launch_interactive_shell
}

_error2_n() {
    echo -e "ERROR: ${1}: ${2}"
    _info "Launching interactive shell for repairs"
    launch_interactive_shell
}

_title_n() {
    echo -e "\n > ${1}\n"
}


#=================================== Common functions ===================================#

parse_kernel_args() {
    # Common global variables
    LIVE_CONFIG="0"
    LIVE_REPAIR="0"
    LIVE_COPY2RAM="0"
    LIVE_EJECT="1"
    
    # aboot variables
    LIVE_FUNC="mods,boot,sfs,tmpfs,c2r,aufs,move,setup"
    LIVE_MODPROBE="cdrom,isofs,usb_storage,sd_mod,sr_mod,squashfs,aufs"
    LIVE_WAIT=""
    LIVE_BOOT_DEV=""
    LIVE_SFS_IMG="aboot/root.sfs"
    LIVE_TMPFS_SIZE="50%"
    
    # aboot_config variables
    LIVE_HOSTNAME="aboot"
    LIVE_ROOT_PASS="root"
    LIVE_TIMEZONE="Europe/Sofia"
    LIVE_KEYMAP="qwerty/us"
    LIVE_LOCALE="en_US.UTF-8"
    LIVE_LOCALE_TYPE="UTF-8"
    LIVE_USER="live"
    LIVE_USER_PASS="${LIVE_USER}"
    LIVE_USER_UID="1000"
    LIVE_USER_SHELL="/bin/bash"
    LIVE_USER_GROUPS="audio,lp,network,optical,storage,video,wheel,games,power"
    LIVE_INTERFACE="eth0"

    # Variables that never should be changed in normal circumstances
    boot_mnt="/aboot/boot"
    ro_branch="/aboot/ro"
    rw_branch="/aboot/rw"
    newroot="/new_root"
    store="/aboot"

    for arg in $(cat /proc/cmdline);do
        case "${arg}" in
            live_config=1|live_config=2) LIVE_CONFIG="${arg##*=}" ;;
            live_repair=1) LIVE_REPAIR="1" ;;
            live_copy2ram=1) LIVE_COPY2RAM="1" ;;
            live_eject=0) LIVE_EJECT="0" ;;
            live_func=*) LIVE_FUNC="${arg##*=}" ;;
            live_modprobe=*) LIVE_MODPROBE="${arg##*=}" ;;
            live_boot_dev=*) LIVE_BOOT_DEV="${arg##*=}" ;;
            live_wait=*) LIVE_WAIT="${arg##*=}" ;;
            live_sfs_img=*) LIVE_SFS_IMG="${arg##*=}" ;;
            live_tmpfs_size=*) LIVE_TMPFS_SIZE="${arg##*=}" ;;
            live_hostname=*) LIVE_HOSTNAME="${arg##*=}" ;;
            live_root_pass=*) LIVE_ROOT_PASS="${arg##*=}" ;;
            live_timezone=*) LIVE_TIMEZONE="${arg##*=}" ;;
            live_keymap=*) LIVE_KEYMAP="${arg##*=}" ;;
            live_locale=*) LIVE_LOCALE="${arg##*=}" ;;
            live_user=*) LIVE_USER="${arg##*=}"; LIVE_USER_PASS="${arg##*=}" ;;
            live_user_pass=*) LIVE_USER_PASS="${arg##*=}" ;;
            live_user_uid=*) LIVE_USER_UID="${arg##*=}" ;;
            live_user_shell=*) LIVE_USER_SHELL="${arg##*=}" ;;
            live_user_groups=*) LIVE_USER_GROUPS="${arg##*=}" ;;
            live_interface=*) LIVE_INTERFACE="${arg##*=}" ;;
        esac
    done
}