rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led

# 扩容 ZN-M2 / CMIOT-AX18 分区：缩小系统分区，最大化overlay插件空间
cd $OPENWRT_PATH
sed -i 's#reg = <0x0580000 0x280000>#reg = <0x0580000 0x800000>#g' target/linux/qualcommax/dts/ipq6018-cmiot-ax18.dts
sed -i 's#partition@800000#partition@d80000#g' target/linux/qualcommax/dts/ipq6018-cmiot-ax18.dts
sed -i 's#reg = <0x0800000 0xf800000>#reg = <0x0d80000 0xf280000>#g' target/linux/qualcommax/dts/ipq6018-cmiot-ax18.dts
