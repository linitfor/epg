# 台灣EPG 頻道
https://epg.pw/search/channel/YXhu.html?lang=zh-hant&timezone=QXNpYS9UYWlwZWk%3D

修改步驟
1. APTV.m3u header
   ex. #EXTM3U x-tvg-url="https://raw.githubusercontent.com/linitfor/epg/refs/heads/main/epg/1.xml"
3. tvg-id=""
   ex.
   #EXTINF:-1 group-title="APTV" tvg-name="" tvg-id="369313" tvg-language="zh" tvg-logo="http://epg.51zmt.top:8000/tb1/gt/HBOHD.png", HBO HD
   http://125.227.210.55:8153/VideoInput/play.ts
5. epg_script 添加更新epg 資訊頻道
   https://github.com/linitfor/epg/blob/main/epg_script
   


# epg-xml

由于廉价vps的稳定性,可靠性实在无法估量，故将所调用的台标文件及xml节目单数据分发到此，如果你可以流畅访问，建议将EPG调用数据的地址修改为这里。

* 112114.xyz 网站部分数据
  * pp.xml 文件为：节目单数据（每6小时更新一次）
    * 调用地址：<https://raw.githubusercontent.com/sparkssssssssss/epg/main/pp.xml>
  * pp.xml.gz 文件为：.gz格式压缩包文件（每6小时更新一次）
    * 调用地址：<https://raw.githubusercontent.com/sparkssssssssss/epg/main/pp.xml.gz>

  * logo 文件夹为：目前网站数据库已存在的电视台台标文件夹
    * 调用地址：<https://raw.githubusercontent.com/sparkssssssssss/epg/main/logo/文件名.png>
    * 请自行将“文件名”修改为对应的文件名
