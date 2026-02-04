# FPGA_Based_Voting_Machine

A simple Verilog-based voting machine designed for FPGA/ASIC simulation and prototyping.
This project implements a **4-candidate voting system** with button validation, vote counting, and result display using LEDs.

---

## 📌 Features

* Supports **4 candidates**
* Button press validation (prevents accidental or noisy inputs)
* Individual vote counters for each candidate
* Two operating modes:

  * **Voting Mode** → Accept votes
  * **Result Mode** → Display vote counts
* Reset functionality to clear votes
* Designed assuming **100 MHz clock**

---

## 📂 Project Structure

```
Voting_Machine.v        → Top-level module
button_control.v        → Button validation and debouncing
vote_accumulator.v      → Vote counting logic
mode.v                  → Mode control and LED display logic
```

---

## ⚙️ Top-Level Module

### Module Name

`Voting_Machine`

### Inputs

| Signal  | Description                    |
| ------- | ------------------------------ |
| clk     | System clock (100 MHz assumed) |
| rst     | Reset signal (active high)     |
| button1 | Vote for Candidate 1           |
| button2 | Vote for Candidate 2           |
| button3 | Vote for Candidate 3           |
| button4 | Vote for Candidate 4           |
| mode_v  | Mode selector                  |

### Output

| Signal   | Description                          |
| -------- | ------------------------------------ |
| led[7:0] | Displays voting status or vote count |

---

## 🧩 Module Description

### 1️⃣ button_control

Validates a button press before registering a vote.

#### Function

* Detects if button is pressed continuously for ~1 second.
* Prevents noise or accidental pressing.

#### Output

* Generates `valid_vote` pulse for one clock cycle.

---

### 2️⃣ vote_accumulator

Stores vote counts for each candidate.

#### Function

* Increments candidate vote when valid vote detected.
* Works only in **Voting Mode**
* Resets vote counts when `rst` is high.

#### Vote Storage

Each candidate uses **8-bit counter**

* Maximum votes per candidate = 255

---

### 3️⃣ mode

Controls system behavior and LED output.

#### Voting Mode (mode = 0)

* Allows voting
* LEDs glow when vote is detected

#### Result Mode (mode = 1)

* Displays vote count of selected candidate
* Press corresponding button to see vote count

---

## ⏱️ Clock and Timing

The design assumes:

```
Clock Frequency = 100 MHz
```

Button press validation uses:

```
100,000,000 clock cycles ≈ 1 second
```

If using different clock:

```
New Count = Clock Frequency × Required Time
```

---

## 🧪 Simulation

You can simulate using **Icarus Verilog** or **ModelSim**

### Compile

```
iverilog -o voting_tb tb_voting_machine.v Voting_Machine.v button_control.v vote_accumulator.v mode.v
```

### Run

```
vvp voting_tb
```

---

## 🔌 FPGA Implementation

### Suggested Connections

* Buttons → Physical push buttons
* Mode → Toggle switch
* LEDs → 8 FPGA LEDs
* Reset → Reset push button

---

## ⚠️ Limitations

* Maximum vote count limited to 255
* Votes stored only in registers (not permanent)
* Long button press required (1 second)

---

## 🚀 Future Improvements

* Add LCD or seven-segment display
* Increase vote storage capacity
* Add EEPROM or flash memory storage
* Implement authentication or voter ID system
* Add UART / wireless result transmission


---

## 👨‍💻 Author

Shashank Shekhar Pandey
