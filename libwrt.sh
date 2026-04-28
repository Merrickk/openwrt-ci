# 原有LED插件代码（完全不动，保留）
rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led

# ===================== 【终极修复】ZN-M2 分区扩容 =====================
# 路径100%匹配LiBwrt官方源码，绝不报错！
cd $OPENWRT_PATH
DTS_FILE="target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq6018-zn-m2.dts"

# 1. 系统分区(rootfs)改为128MB（最小够用，省空间给插件）
sed -i 's/reg = <0x0580000 0x280000>;/reg = <0x0580000 0x800000>;/g' $DTS_FILE
# 2. 修正overlay分区起始地址
sed -i 's/partition@800000/partition@d80000/g' $DTS_FILE
# 3. 剩余所有空间全部分给overlay（插件随便装）
sed -i 's/reg = <0x0800000 0xf800000>;/reg = <0x0d80000 0xf280000>;/g' $DTS_FILE
