# label-propagation-matlab

script.m  

+ 根据不同的数据，需要修改这两行
X=data;
Y=double(labels);
+ 修改method变量，控制执行哪个算法

## ACC of different methods 10% labeled 
| Dataset          |       LGC      |  GFHF             |   LNP      | DLP      |   SIS  |
|------------------|----------------|------------------ |------------|----------|--------|
| PennDigits       |                |                   |            |          |        |
| Mnist10K         |                |                   |            |0.905000  |        |


## ARI of different methods 10% labeled 
| Dataset          |       LGC      |  GFHF             |   LNP      | DLP      |   SIS  |
|------------------|----------------|------------------ |------------|----------|--------|
| PennDigits       |                |                   |            |          |        |
| Mnist10K         |                |                   |            |0.803309  |        |

## NMI of different methods 10% labeled 
| Dataset          |       LGC      |  GFHF             |   LNP      | DLP      |   SIS  |
|------------------|----------------|------------------ |------------|----------|--------|
| PennDigits       |                |                   |            |          |        |
| Mnist10K         |                |                   |            |0.804323  |        |
