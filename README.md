# label-propagation-matlab

script.m  

+ 根据不同的数据，需要修改这两行
X=data;
Y=double(labels);
+ 修改method变量，控制执行哪个算法

## ACC of different methods 10% labeled 
| Dataset    | LGC      | GFHF     | LNP      | DLP      | SIS      |
| ---------- | -------- | -------- | -------- | -------- | -------- |
| PennDigits | 0.977620 | 0.966521 | 0.976983 | 0.981259 | 0.980258 |
| Mnist10K   |          |          |          | 0.905000 |          |


## ARI of different methods 10% labeled 
| Dataset    | LGC      | GFHF     | LNP      | DLP      | SIS      |
| ---------- | -------- | -------- | -------- | -------- | -------- |
| PennDigits | 0.951804 | 0.929749 | 0.949598 | 0.958880 | 0.956694 |
| Mnist10K   |          |          |          | 0.803309 |          |

## NMI of different methods 10% labeled 
| Dataset    | LGC      | GFHF     | LNP      | DLP      | SIS      |
| ---------- | -------- | -------- | -------- | -------- | -------- |
| PennDigits | 0.955705 | 0.941632 | 0.945027 | 0.952917 | 0.952066 |
| Mnist10K   |          |          |          | 0.804323 |          |
