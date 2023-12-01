# 获取本机 IP 地址
$WLANUserIP = ((Get-NetIPAddress -AddressFamily IPv4).IPv4Address
                | Select-String -Pattern '10\.\d+\.\d+\.\d+')

# 在引号中填入校园网账号
$Account = ''
# 在引号中填入校园网密码
$Password = ''
# 根据校园网账号运营商类型填入：
# 中国移动 --> cmcc
# 中国联通 --> unicom
# 中国电信 --> telecom
$ServiceProvider = ''

$AuthUrl = "http://10.2.5.251:801/eportal/?c=Portal&a=login&callback=dr1699582158609&login_method=1&user_account=$Account%40$ServiceProvider&user_password=$Password&wlan_user_ip=$WLANUserIP&wlan_user_mac=000000000000&wlan_ac_ip=&wlan_ac_name=&jsVersion=3.0&_=1699582148"
Invoke-WebRequest -Uri $AuthUrl