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
  AA

### 待改
  DBLl有問題<br>
