# Display Three Initials — 8086 Assembly Program

## Description
This program is written in **8086 Assembly Language** for the **AMU 8086 Simulator**.
It takes three initials from the user (First, Middle, and Last) and displays each initial
on a new line down the left margin of the screen.

---

## Sample Execution

```
ENTER THREE INITIALS: JFK
J
F
K
```

---

## How It Works

1. The program displays a prompt: `ENTER THREE INITIALS:`
2. The user types three initials one after another (e.g. `JFK`)
3. Each initial is read one character at a time using `INT 21H`
4. Each initial is stored in a safe register immediately after being read
5. After all three initials are read, they are printed one by one
6. A newline (`0DH, 0AH`) is printed after each initial to move to the next line

---

## Registers Used and Their Functions

| Register | Role | Description |
|----------|------|-------------|
| `AX` | Data Segment Init | Used to initialize the Data Segment register at program start (`MOV AX, @DATA`) |
| `DS` | Data Segment | Points to the program's data segment where messages are stored |
| `AH` | DOS Function Selector | Holds the DOS interrupt function number (01H = read char, 02H = print char, 09H = print string, 4CH = exit) |
| `AL` | Input Register | Receives the character read from keyboard via `INT 21H` (AH=01H) |
| `BL` | First Initial Storage | Stores the **First Initial** entered by the user safely until it is printed |
| `BH` | Middle Initial Storage | Stores the **Middle Initial** entered by the user safely until it is printed |
| `CH` | Last Initial Storage | Stores the **Last Initial** entered by the user safely until it is printed |
| `DX` | Output / Address Register | Used with `LEA DX` to point to strings for printing, and `DL` holds character for `INT 21H` (AH=02H) |
| `DL` | Character Output | Holds the character to be printed when using `INT 21H` with `AH=02H` |

---

## Why These Specific Registers?

- `BL` and `BH` are the **low and high bytes of BX** — they are not affected by `LEA DX` or `INT 21H` calls, making them safe storage for the first two initials.
- `CH` is the **high byte of CX** — also not touched by any DOS interrupt or address instructions used in this program, making it safe for the last initial.
- `DX` is intentionally **left free** for use with `LEA DX, message` and `INT 21H` output calls.
- Storing initials in `DH` or `DL` would be **unsafe** because `LEA DX, CRLF` overwrites the entire `DX` register (both `DH` and `DL`).

---

## Data Segment

| Variable | Value | Purpose |
|----------|-------|---------|
| `MSG1` | `"ENTER THREE INITIALS: $"` | Prompt displayed to user |
| `CRLF` | `0DH, 0AH, "$"` | Newline sequence to move cursor to next line |

---

## DOS Interrupts Used

| Interrupt | AH Value | Function |
|-----------|----------|---------|
| `INT 21H` | `01H` | Read a single character from keyboard (stored in AL) |
| `INT 21H` | `02H` | Print a single character from DL to screen |
| `INT 21H` | `09H` | Print a string ending with `$` pointed to by DX |
| `INT 21H` | `4CH` | Exit the program and return to DOS |

---

## Program Flow

```
START
  |--> Initialize Data Segment (AX = @DATA, DS = AX)
  |--> Display "ENTER THREE INITIALS: "
  |--> Read First Initial  --> Store in BL
  |--> Read Middle Initial --> Store in BH
  |--> Read Last Initial   --> Store in CH
  |--> Print Newline
  |--> Print BL (First Initial)  + Newline
  |--> Print BH (Middle Initial) + Newline
  |--> Print CH (Last Initial)   + Newline
END
```

---

## How to Run

1. Open **AMU 8086 Simulator**
2. Click **File** → **Open**
3. Select the `initials.asm` file
4. Click **Assemble** to compile
5. Click **Run** to execute
6. Type three initials when prompted (e.g. `JFK`)
7. Each initial will be displayed on a new line

---

## Tools Required

- **AMU 8086 Simulator**
- **Windows OS**

---

## Author

| Field | Details |
|-------|---------|
| Name | Noreen Jahan |
| Roll No | 24-Arid-1068 |
| Class | BSSE-4A |
| Subject | Assembly Language Programming |
