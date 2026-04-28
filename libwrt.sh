# 原有LED插件代码（不动，保留）
rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led

# ===================== 修复版：ZN-M2 分区扩容（overlay拉满） =====================
cd $OPENWRT_PATH
# 修改系统分区为128MB，剩余空间全给overlay（官方源码精准匹配）
sed -i 's/reg = <0x0580000 0x280000>;/reg = <0x0580000 0x800000>;/g' target/linux/qualcommax/dts/ipq6018-zn-m2.dts
sed -i 's/partition@800000/partition@d80000/g' target/linux/qualcommax/dts/ipq6018-zn-m2.dts
sed -i 's/reg = <0x0800000 0xf800000>;/reg = <0x0d80000 0xf280000>;/g' target/linux/qualcommax/dts/ipq6018-zn-m2.dts
