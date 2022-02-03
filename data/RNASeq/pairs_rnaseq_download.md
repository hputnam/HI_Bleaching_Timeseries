```
nano datadownload.sh
```

```
#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --export=NONE
#SBATCH --mem=100GB
#SBATCH --account=putnamlab
#SBATCH -D /data/putnamlab/KITT/hputnam/20220203_BleachedPairs_RNASeq

#download data

wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/16_S121_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/16_S121_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/17_S122_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/17_S122_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/21_S123_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/21_S123_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/22_S124_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/22_S124_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/23_S125_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/23_S125_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/24_S126_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/24_S126_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/25_S127_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/25_S127_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/26_S128_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/26_S128_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/28_S129_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/28_S129_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/29_S130_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/29_S130_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/2_S118_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/2_S118_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/30_S131_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/30_S131_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/31_S132_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/31_S132_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/33_S133_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/33_S133_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/37_S134_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/37_S134_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/39_S135_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/39_S135_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/42_S136_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/42_S136_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/43_S137_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/43_S137_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/45_S138_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/45_S138_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/46_S139_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/46_S139_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/47_S140_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/47_S140_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/4_S119_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/4_S119_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/50_S141_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/50_S141_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/51_S142_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/51_S142_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/52_S143_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/52_S143_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/54_S144_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/54_S144_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/55_S145_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/55_S145_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/56_S146_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/56_S146_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/57_S147_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/57_S147_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/59_S148_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/59_S148_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/60_S149_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/60_S149_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/61_S150_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/61_S150_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/62_S151_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/62_S151_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/63_S152_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/63_S152_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/64_S153_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/64_S153_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/65_S154_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/65_S154_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/66_S155_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/66_S155_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/67_S156_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/67_S156_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/68_S157_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/68_S157_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/6_S120_L003_R1_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/6_S120_L003_R2_001.fastq.gz
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/20211214_URI_HolliePutnam_WTSmRNASeq_1_md5.txt
wget http://'user1':'dnalink1234%'@download.dnalink.com/RawData2/Fastq/20211214_URI_HolliePutnam_WTSmRNASeq_1/20211214_URI_HolliePutnam_WTSmRNASeq_1_Summary.txt

```

```
sbatch datadownload.sh
```