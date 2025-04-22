
---

### ✅ Tips:
- You can **copy-paste this into your GitHub repo** by clicking **“Add file” → “Create new file” → Name it `README.md`**, then paste the content.
- Update anything you want to personalize further.

Want me to create a `LICENSE` file too or include images/diagrams for the Wumpus World? I can help with that!






# wumpus-world-simulation# 🧠 Wumpus World Simulation (Prolog)

This project is a **Prolog simulation of the classic Wumpus World** problem — a popular example in AI and logic-based systems. The agent navigates a 4x4 grid world, avoiding hazards (pits and Wumpus), detecting percepts (breeze, stench, glitter), and attempting to find the gold.

---

## 📌 Features

- Define static environment (pits, wumpus, gold)
- Agent starts at (1,1) and explores safely
- Percept rules:
  - `breeze` if pit is adjacent
  - `stench` if wumpus is adjacent
  - `glitter` if gold is present
- Avoids visited, dangerous cells
- Uses recursive search to explore

---

## 📂 Files

- `wumpus_world.pl`: Main Prolog file with environment, rules, and agent logic

---

## 🚀 How to Run

1. Make sure you have **SWI-Prolog** installed:  
   👉 [https://www.swi-prolog.org/Download.html](https://www.swi-prolog.org/Download.html)

2. Load the file:
   ```prolog
   ?- [wumpus_world].

?- start.




 Example Output
 Agent starting at (1,1)
Agent at (1,1)
 Breeze detected. 
Agent at (2,1)
Agent at (2,2)
 Stench detected. 
Agent at (2,3)
 Glitter detected (Gold is here!).
 Gold found at (2,3)!
 Returning safely...



