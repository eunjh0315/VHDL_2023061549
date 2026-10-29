# VHDL과제

2023061549 은지형

VHDL_1 마지막 장의 1~5번 과제입니다.

## 제출 파일

- VHDL 소스: `p1_logic4.vhd`, `p2_mux8_1.vhd`, `p3_letters.vhd`, `p4_vote25.vhd`, `p5_count13_display.vhd`
- 공통 7세그먼트 디코더: `hex7seg.vhd`
- Logisim 통합 프로젝트: `VHDL_Final.circ`
- 문제별 프로젝트: `P1_Logic4.circ` ~ `P5_Count13_Display.circ`
- 보고서: `VHDL과제_2023061549_은지형.pdf`
- 전체 자료: `VHDL과제_2023061549_은지형.zip` (시험 입력, 테스트벤치, 실행 로그 포함)

## 실행과 검증

Logisim-evolution 5.0.0에서 `VHDL_Final.circ`를 열고 왼쪽의 회로를 더블 클릭합니다.
같은 이름의 터널은 연결되어 있습니다. 입력 단자는 손 모양 도구로 바꿀 수 있습니다.
`display(7 downto 0)`의 순서는 `a b c d e f g dp`이며 1일 때 점등합니다.

Questa Altera Starter FPGA Edition 2025.2, VHDL-2008에서 소스 컴파일 오류와 경고가 없었습니다.
Logisim과 Questa에서 각각 19,057건을 검사했고 모두 통과했습니다.

| 회로 | 시험 수 | 결과 |
|---|---:|---|
| 1. 4입력 AND/OR | 16 | 통과 |
| 2. 8:1 MUX | 2,048 | 통과 |
| 3. 문자 표시 | 8 | 통과 |
| 4. 25인 다수결 투표 | 569 | 통과 |
| 5. 13비트의 1 개수 표시 | 16,384 | 통과 |
| 공통 0~F 디코더와 enable | 32 | 통과 |

4번은 경계값, 비트 위치, 난수 및 입력 전이 시험이며 나머지는 각 시험 범위의 전수 검사입니다.
시뮬레이션의 +acc 최적화 안내 경고 1건은 기능 실패가 아닙니다.
13비트에서 1의 개수는 최대 13이므로 5번에서 E/F는 나오지 않으며, 공통 디코더에서 별도 검사했습니다.

컴파일 순서:

```tcl
vlib work
vcom -2008 p1_logic4.vhd p2_mux8_1.vhd p3_letters.vhd p4_vote25.vhd hex7seg.vhd p5_count13_display.vhd
```

전체 시험을 재실행하려면 ZIP을 한글이 없는 폴더에 풀고 내부 README의 순서를 따릅니다.

## 참고

- 수업 자료 VHDL_1, 마지막 장
- 예제 코드: https://github.com/lizhuoh9/VHDL_code
