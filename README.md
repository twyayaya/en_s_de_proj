# 紀錄日期 : 2022.02.10<br>

# 紀錄
  目前用test2_RP,presim正常,postsim不正常<br>
  <br>
  以下都是舊版本資訊

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
目前不管單個or雙個error發生,都會輸出real_data

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

#### R_EN = 0
- 沒讀取動作
- R_ADDRr = 0 , error_data = 0

#### R_EN = 1 , DB = 0 , SB = 0
- 有讀取動作, 但data都正確 ,所以不輸出值
- R_ADDRr = 0 , error_data = 0

#### R_EN = 1 , DB = 0 , SB = 1
- 有讀取動作, 但data有單個錯誤但被修正( real_data != wrong_real_data ) ,輸出位置和錯誤的data
- R_ADDRr = R_ADDR , error_data = wrong_real_data

#### R_EN = 1 , DB = 1 , SB = 1
- 有讀取動作, 但data有多個錯誤且沒被修正( real_data = wrong_real_data ) ,輸出位置和錯誤的data
- R_ADDRr = R_ADDR , error_data = wrong_real_data

#### NO error
- real_data = wrong_real_data : 正確的data

#### 單個 error
- real_data                   : 更正過的data
- wrong_real_data             : 沒更正過的data

#### 兩個 error
- real_data = wrong_real_data : 沒更正過的data

#### 官網敘述<br>
|DB_DETECT |  SB_CORRECT | 意思 |
|:----: |:----:| :----:|
| 0 |  0 | 沒error,data正確不須更正 |
| 0 |  1 | 單個error被偵測到,在output會被更正 |
| 1 |  1 | 兩個error被偵測到,但不會更正 |

![](https://github.com/twyayaya/en_s_de_proj/blob/main/get_address_new/wave.jpg)<br>

### 待改
  1.  DBLl有問題<br>
  2.  get address new的<br>
  ```
  if( (SB_CORRECT != DB_DETECT) && (SB_CORRECT ==1) )begin // singel error , will be corrected,( || (real_data != wrong_real_data) )
  ```
  (real_data != wrong_real_data)在LSRAM(ECC)會出問題,因為wrong_real_data是直接抓W_DATA會和R_ADDR,R_DATA出問題
