��    �      �  �   \	      p     q  �   �  <   F     �     �     �     �     �     �     �       7        M     b     }  &   �     �  "   �  D   �  A   0  7   r  !   �     �  "   �  A     '   O     w     �  #   �     �  #   �  -        3  $   K     p     �     �  %   �  F   �     (     7  *   R     }     �  &   �     �     �            %   5     [     s  %   �  #   �     �     �  1     8   3  (   l     �  ,   �  )   �  *     !   2  y   T      �  *   �       ?   (  4   h     �     �      �     �  %     !   +  0   M  8   ~  @   �     �       D   +     p  1   �  '   �  0   �  9     )   L  (   v  &   �     �     �  '   �  )     !   I  '   k     �     �     �     �  "   �  /     6   7  6   n  >   �     �     �  &     M   A  5   �  2   �  +   �  6   $  #   [       (   �     �  .   �                :     T     q  &   �  3   �  '   �       N   )     x  O   �     �  
   �        ,         D   "   J      m   	   �      �      �   1   �      �      �      �   (   !  1   ;!     m!  �  v!  ;   3#    o#  ^   s$  %   �$     �$     %     "%  "   9%  (   \%     �%     �%  Z   �%  $   �%  $   "&     G&  A   K&  *   �&  >   �&  e   �&  c   ]'  H   �'  4   
(  8   ?(  2   x(  v   �(  7   ")  #   Z)      ~)  :   �)  %   �)  <    *  F   =*  #   �*  <   �*  *   �*  &   +  1   7+  7   i+  �   �+     5,     J,  K   e,  ,   �,     �,  I   �,  '   F-  +   n-  :   �-     �-  ,   �-  "   !.  -   D.  1   r.  1   �.  $   �.     �.  M   /  b   g/  I   �/  &   0  D   ;0  5   �0  7   �0  "   �0  �   1  %   �1  Y   �1     W2  D   p2  A   �2     �2      3  /   83  :   h3  0   �3  9   �3  7   4  V   F4  O   �4     �4  $   
5  _   /5  "   �5  I   �5  G   �5  =   D6  b   �6  =   �6  ;   #7  9   _7  0   �7     �7  /   �7  B   8  "   U8  E   x8  =   �8  	   �8  &   9     -9  6   K9  P   �9  U   �9  ?   ):  Q   i:     �:      �:  ;   �:  c   6;  I   �;  @   �;  q   %<  @   �<  .   �<     =  A   !=  1   c=  H   �=  $   �=     >  %    >     F>  *   e>  =   �>  r   �>  9   A?  "   {?  b   �?     @  z   @  &   �@     �@  -   �@  A   �@  
   3A  6   >A  +   uA     �A     �A     �A  H   �A  8   ,B     eB  ,   kB  >   �B  8   �B     C     "   O      }         ;   C       5   .   c                 r   v   6   u           ]   ~   b   H      E   #   '   �   T       8      [   B   $   _       1       @          l   J   2   Q   	               M   q         )   �          9       s      K       �       p   y          �   U   :      �   ^   S   x   <   �   R   �   P   �          �   
      3       >          W       k   h   o                     e   \      %   w                       -       �              �   n   *   4                 !      �   F       ,   =       a       `   A           I   t   �   �       �   +   7       m          N   g   X   �          �   �       Z           D   0   f   L       ?       V   z   j   /   &   G         �   d   (   Y   �   {      |   i       �        
<action> is one of:
 
<name> is the device to create under %s
<device> is the encrypted device
<key slot> is the LUKS key slot number to modify
<key file> optional key file for the new key for luksAddKey action
 
WARNING: real device header has different UUID than backup! %s: requires %s as arguments <device> <device> <key slot> <device> <name>  <device> [<key file>] <device> [<new key file>] <name> <name> <device> Align payload at <n> sector boundaries - for luksFormat All key slots full.
 Argument <action> missing. BITS Backup LUKS device header and keyslots Backup file %s doesn't exist.
 Can't format LUKS without device.
 Cannot add key slot, all slots disabled and no volume key provided.
 Cannot create LUKS header: header digest failed (using hash %s).
 Cannot create LUKS header: reading random salt failed.
 Cannot get info about device %s.
 Cannot get process priority.
 Cannot initialize crypto backend.
 Cannot initialize device-mapper. Is dm_mod kernel module loaded?
 Cannot open device %s for %s%s access.
 Cannot open device %s.
 Cannot open file %s.
 Cannot open header backup file %s.
 Cannot read device %s.
 Cannot read header backup file %s.
 Cannot retrieve volume key for plain device.
 Cannot wipe device %s.
 Cannot write header backup file %s.
 Command failed with code %i Command successful.
 Create a readonly mapping DM-UUID for device %s was truncated.
 Data offset or key size differs on device and backup, restore failed.
 Device %s %s%s Device %s already exists.
 Device %s doesn't exist or access denied.
 Device %s has zero size.
 Device %s is busy.
 Device %s is not a valid LUKS device.
 Device %s is not active.
 Device %s is too small.
 Display brief usage Do not ask for confirmation Enter LUKS passphrase to be deleted:  Enter LUKS passphrase:  Enter any passphrase:  Enter any remaining LUKS passphrase:  Enter new passphrase for key slot:  Enter passphrase for %s:  Enter passphrase:  Error during update of LUKS header on device %s.
 Error re-reading LUKS header after update on device %s.
 Error reading passphrase from terminal.
 Error reading passphrase.
 Failed to access temporary keystore device.
 Failed to obtain device mapper directory. Failed to open temporary keystore device.
 Failed to read from key storage.
 Failed to setup dm-crypt key mapping for device %s.
Check that kernel supports %s cipher (check syslog for more info).
%s Failed to write to key storage.
 File with LUKS header and keyslots backup. Help options: How many sectors of the encrypted data to skip at the beginning How often the input of the passphrase can be retried Invalid device %s.
 Invalid key size.
 Invalid plain crypt parameters.
 Key %d not active. Can't wipe.
 Key size must be a multiple of 8 bits Key slot %d active, purge first.
 Key slot %d is full, please select another one.
 Key slot %d is invalid, please select between 0 and %d.
 Key slot %d is invalid, please select keyslot between 0 and %d.
 Key slot %d is invalid.
 Key slot %d is not used.
 Key slot %d material includes too few stripes. Header manipulation?
 Key slot %d unlocked.
 LUKS header detected but device %s is too small.
 No key available with this passphrase.
 No known cipher specification pattern detected.
 Not compatible PBKDF2 options (using hash algorithm %s).
 Option --header-backup-file is required.
 Out of memory while reading passphrase.
 PBKDF2 iteration time for LUKS (in ms) Passphrases do not match.
 Print package version Read the volume (master) key from file. Requested LUKS hash %s is not supported.
 Requested file %s already exist.
 Restore LUKS device header and keyslots Resume suspended LUKS device. SECTORS Show debug messages Show this help message Shows more detailed error messages Slot number for new key (default is first free) Suspend LUKS device and wipe key (all IOs are frozen). The cipher used to encrypt the disk (see /proc/crypto) The hash used to create the encryption key from the passphrase The size of the device The size of the encryption key The start offset in the backend device This is the last keyslot. Device will become unusable after purging this key. This operation is not supported for %s crypt device.
 This operation is supported only for LUKS device.
 This will overwrite data on %s irrevocably. Timeout for interactive passphrase prompt (in seconds) Unable to obtain sector size for %s Unknown action. Unknown crypt device type %s requested.
 Unsupported LUKS version %d.
 Verifies the passphrase by asking for it twice Verify passphrase:  Volume %s is already suspended.
 Volume %s is not active.
 Volume %s is not suspended.
 Volume key buffer too small.
 Volume key does not match the volume.
 WARNING!!! Possibly insecure memory. Are you root?
 [OPTION...] <action> <action-specific>] add key to LUKS device already contains LUKS header. Replacing header will destroy existing keyslots. create device does not contain LUKS header. Replacing header can destroy data on that device. dump LUKS partition information exclusive  formats a LUKS device memory allocation error in action_luksFormat msecs open LUKS device as mapping <name> print UUID of LUKS device read-only remove LUKS mapping remove device removes supplied key or key file from LUKS device resize active device secs show device status tests <device> for LUKS partition header wipes key with number <key slot> from LUKS device writable Project-Id-Version: cryptsetup 1.1.1-rc1
Report-Msgid-Bugs-To: dm-crypt@saout.de
POT-Creation-Date: 2011-11-09 13:00+0100
PO-Revision-Date: 2010-05-03 18:14+0930
Last-Translator: Clytie Siddall <clytie@riverland.net.au>
Language-Team: Vietnamese <vi-VN@googlegroups.com>
Language: vi
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Generator: LocFactoryEditor 1.8
 
<hành_vi> là một của những điều dưới đây:
 
<tên> là thiết bị cần tạo dưới %s
<thiết_bị> là thiết bị đã mật mã
<khe_khoá> là số thứ tự khe khoá LUKS cần sửa đổi
<tập_tin_khoá> là tập tin khoá tuỳ chọn cho khoá mới trong hành động luksAddKey
 
CẢNH BÁO: phần đầu thiết bị thật có mã số UUID khác với bản sao lưu ! %s: cần thiết %s làm đối số <thiết_bị> <thiết_bị> <khe_khoá> <thiết_bị> <tên>  <thiết_bị> [<tập_tin_khoá>] <thiết_bị> [<tập_tin_khoá_mới>] <tên> <tên> <thiết_bị> Sắp hàng trọng tải ở <n> biên giới rãnh ghi — cho định dạng luksFormat Mọi khe khoá đều bị đầy.
 Đối số <hành_vi> còn thiếu. BIT Sao lưu phần đầu và các khe khoá của thiết bị LUKS Tập tin sao lưu %s không tồn tại.
 Không thể định dạng LUKS mà không có thiết bị.
 Không thể thêm khe khoá vì mọi khe đều bị tắt và không cung cấp khoá khối tin.
 Không thể tạo phần đầu LUKS: lỗi tạo bản tóm tắt (dùng chuỗi duy nhất %s).
 Không thể tạo phần đầu LUKS: lỗi đọc salt ngẫu nhiên.
 Không thể lấy thông tin về thiết bị %s.
 Không thể lấy mức ưu tiên của tiến trình.
 Không thể sơ khởi hậu phương mật mã.
 Không thể sơ khởi tiến trình ánh xạ thiết bị. Mô-đun hạt nhân « dm_mod » được nạp chưa?
 Không thể mở thiết bị %s cho truy cập %s%s.
 Không thể mở thiết bị %s.
 Không thể mở tập tin %s.
 Không mở được tập tin sao lưu phần đầu %s.
 Không thể đọc thiết bị %s.
 Không đọc được tập tin sao lưu phần đầu %s.
 Không thể lấy khoá khối tin cho thiết bị bình thường.
 Không thể xoá thiết bị %s.
 Không thể ghi nhớ tập tin sao lưu phần đầu %s.
 Câu lệnh đã thất bại với mã %i Câu lệnh đã chạy thành công.
 Tạo một sự ánh xạ chỉ cho phép đọc Mã số DM-UUID cho thiết bị %s bị cắt bớt.
 Khoảng bù dữ liệu hoặc kích cỡ khoá vẫn khác nhau trên thiết bị và bản sao lưu thì chức năng phục hồi bị lỗi.
 Thiết bị %s %s%s Thiết bị %s đã có.
 Thiết bị %s không tồn tại hoặc không đủ quyền truy cập.
 Thiết bị %s có kích cỡ số không.
 Thiết bị %s đang bận.
 Thiết bị %s không phải là một thiết bị kiểu LUKS đúng.
 Thiết bị %s không hoạt động.
 Thiết bị %s có kích cỡ quá nhỏ.
  Hiển thị thông điệp ngắn về cách sử dụng Đừng yêu cầu xác nhận Gõ cụm từ mật khẩu LUKS cần xoá: Gõ cụm từ mật khẩu LUKS:  Gõ bất cứ cụm từ mật khẩu nào:  Gõ cụm từ mật khẩu LUKS nào còn lại: Gõ cụm từ mật khẩu mới cho khe khoá:  Gõ cụm từ mật khẩu cho %s:  Gõ cụm từ mật khẩu:  Gặp lỗi trong khi cập nhật phần đầu LUKS trên thiết bị %s.
 Gặp lỗi trong khi đọc lại phần đầu LUKS sau khi cập nhật trên thiết bị %s.
 Gặp lỗi khi đọc cụm từ mật khẩu từ thiết bị cuối.
 Lỗi đọc cụm từ mật khẩu.
 Lỗi truy cập đến thiết bị lưu trữ khoá tạm thời.
 Lỗi lấy thư mục trình ánh xạ thiết bị. Lỗi mở thiết bị lưu trữ khoá tạm thời.
 Lỗi đọc từ kho lưu khoá.
 Lỗi thiết lập chức năng ánh xạ khoá dm-crypt cho thiết bị %s.
Kiểm tra lại hạt nhân hỗ trợ mật mã %s
(xem sổ theo dõi hệ thống để tìm thêm thông tin.)
%s Lỗi ghi khoá vào kho lưu khoá.
 Tập tin chứa bản sao lưu phần đầu và các khe khoá của thiết bị LUKS. Tùy chọn trợ giúp: Bao nhiêu rãnh ghi dữ liệu mật mã cần bỏ qua ở đầu Số các lần có thể thử lại gõ cụm từ mật khẩu Thiết bị không đúng %s.
 Kích cỡ khoá không đúng.
 Sai lập tham số mật mã bình thường.
 Khoá %d không hoạt động thì không xoá được.
 Kích cỡ khoá phải là bội số cho 8 bit Khe khoá %d vẫn hoạt động: cần tẩy trước.
 Khe khoá %d bị đầy, hãy chọn một khe khác.
 Khe khoá %d không đúng, hãy chọn một giá trị trong phạm vi 0 đến %d.
 Khe khoá %d không đúng: hãy chọn khe khoá trong phạm vi 0 đến %d.
 Khe khoá %d không đúng.
 Khe khoá %d không được dùng.
 Nguyên liệu khe khoá %d gồm có quá ít sọc. Có nên thao tác phần đầu không?
 Khe khoá %d được mở khoá.
 Phát hiện được phần đầu LUKS mà thiết bị %s quá nhỏ.
 Không có khoá sẵn sàng dùng với cụm từ mật khẩu này.
 Không phát hiện mẫu chỉ thị mật mã đã biết.
 Gặp các tuỳ chọn PBKDF2 không tương thích (dùng thuật toán chuỗi duy nhất %s).
 Tuỳ chọn « --header-backup-file » cũng cần thiết.
 Tràn bộ nhớ trong khi đọc cụm từ mật khẩu.
 Thời gian lặp lại PBKDF2 cho LUKS (theo mili-giây) Hai cụm từ mật khẩu không trùng nhau.
 In ra phiên bản gói Đọc khoá khối tin (chủ) từ tập tin. Không hỗ trợ chuỗi duy nhất LUKS %s được yêu cầu.
 Yêu cầu tập tin %s đã có.
 Phục hồi phần đầu và các khe khoá của thiết bị LUKS Tiếp tục lại sử dụng thiết bị LUKS bị ngưng. RÃNH GHI Hiển thị thông điệp gỡ lỗi Hiển thị trợ giúp này Hiển thị các thông điệp lỗi chi tiết hơn Số thứ tự khe cho khoá mới (mặc định là khe trống thứ nhất) Ngưng thiết bị LUKS và xoá khoá (thì mọi việc V/R đều đông cứng). Mật mã dùng để bảo vệ đĩa (xem « /proc/crypto ») Chuỗi duy nhất dùng để tạo khoá mật mã từ cụm từ mật khẩu Kích cỡ của thiết bị Kích cỡ của khoá mật mã Khoảng bù đầu tiên trong thiết bị hậu phương Đây là khe khoá cuối cùng. Sau khi tẩy khoá này thì thiết bị không dùng được. Thao tác này không được hỗ trợ cho thiết bị mật mã %s.
 Thao tác này được hỗ trợ chỉ cho thiết bị LUKS.
 Hành động này sẽ ghi đè lên dữ liệu trên thiết bị %s một cách không phục hồi được. Thời hạn khi nhắc gõ cụm từ mật khẩu (theo giây) Không thể lấy kích cỡ rãnh ghi cho %s Hành động không rõ. Không rõ kiểu thiết bị mật mã %s được yêu cầu.
 Phiên bản LUKS không được hỗ trợ %d.
 Thẩm tra cụm từ mật khẩu bằng cách yêu cầu nó hai lần Thẩm tra cụm từ mật khẩu:  Khối %s đã bị ngưng.
 Khối tin %s không hoạt động.
 Khối %s không bị ngưng.
 Vùng đệm khoá khối tin quá nhỏ.
 Khoá khối tin không tương ứng với khối tin đó.
 CẢNH BÁO ! Có thể là vùng nhớ không an toàn. Bạn đang chạy dưới người chủ (root) không?
 [TÙY_CHỌN...] <hành_vi> <đặc_trưng_cho_hành_vi>] thêm khoá vào thiết bị LUKS đã chứa phần đầu LUKS. Thay thế phần đầu thì cũng hủy các khe khoá đã có. tạo thiết bị không chứa phần đầu LUKS. Thay thế phần đầu thì cũng có thể hủy dữ liệu trên thiết bị đó. đổ thông tin về phân vùng LUKS dành riêng định dạng một thiết bị kiểu LUKS gặp lỗi phân cấp vùng nhớ trong « action_luksFormat » mili-giây mở thiết bị LUKS như là bản ánh xạ <tên> in ra mã số UUID của thiết bị LUKS chỉ đọc gỡ bỏ sự ánh xạ LUKS gỡ bỏ thiết bị gỡ bỏ khỏi thiết bị LUKS khoá hoặc tập tin khoá đưa ra thay đổi kích cỡ của thiết bị hoạt động giây hiển thị trạng thái về thiết bị thử <thiết_bị> có phần đầu phân vùng LUKS không xoá khỏi thiết bị LUKS khoá có số <khe_khoá> ghi được 