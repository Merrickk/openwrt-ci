# 原有LED插件代码（不动，保留）
rm -rf package/emortal/luci-app-athena-led
git clone --depth=1 https://github.com/NONGFAH/luci-app-athena-led package/luci-app-athena-led
chmod +x package/luci-app-athena-led/root/etc/init.d/athena_led package/luci-app-athena-led/root/usr/sbin/athena-led

# ===================== 【精准匹配】ZN-M2 分区扩容 =====================
# 路径+文件名 100% 对应你找到的文件，绝不报错！
DTS_FILE="target/linux/qualcommax/dts/ipq6000-m2.dts"

# 1. 系统分区 rootfs 改为 128MB（省空间给插件）
sed -i 's/reg = <0x0580000 0x280000>;/reg = <0x0580000 0x800000>;/g' $DTS_FILE
# 2. 修正 overlay 分区起始地址
sed -i 's/partition@800000/partition@d80000/g' $DTS_FILE
# 3. 剩余所有空间全给 overlay（插件随便装）
sed -i 's/reg = <0x0800000 0xf800000>;/reg = <0x0d80000 0xf280000>;/g' $DTS_FILE
