# 紀錄日期 : 2021.12.6<br>


## 目前架構<br>
64bit版本<br>
![](https://github.com/twyayaya/en_s_de_proj/blob/main/pic/1116_1.jpg)<br>
  ---
  - Input
    - W_EN
    - R_EN
    - W_ADDR[13:0]
    - R_ADDR[13:0]
    - clk
    - INn[63:0]
    - selectt[63:0]
    
    
  - Onput
    - real_data[63:0]
    - R_ADDRr[13:0]
    - wrong_real_data[63:0]
    - SGLl
    - DBLl
    - 
  --- 

## get_address_new <br>
主要根據SB DB做判斷<br>
1.  R_EN = 0 
  dd
    
3. 11
4. 11
5. 111
6. 
  ---
  - Input
    - [13:0] R_ADDR
    - R_EN
    - [63:0] real_data 
    - [63:0] wrong_real_data 
    - DB_DETECT
    - SB_CORRECT
    
    
  - Onput
    - [63:0] error_data
    - [13:0] R_ADDRr
  --- 
|DB_DETECT |  SB_CORRECT | 意思 |
|:----: |:----:| :----:|
| 0 |  0 | 沒error,data正確不須更正 |
| 0 |  1 | 單個error被偵測到,在output會被更正 |
| 1 |  1 | 多個error被偵測到,但不會更正 |



### 待改
  DBLl有問題<br>
