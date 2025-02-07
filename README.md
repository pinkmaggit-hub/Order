# Customizable Hand Sorting for Balatro
## Features
### Ascending/Descending hand sorting:
In vanilla Balatro, cards are always sorted in descending order by rank or suit. With **Order** enabled, pressing the sort button again toggles between descending (orange) and ascending (blue). If your hand is currently sorted in descending order, the next press will switch it to ascending, and vice versa. This works for both Rank and Suit.

However, the default order (see configuration below) is always chosen when switching methods (rank/suit). 

For example: if your default sort is by Suit Descending and your hand is currently sorted by Suit Descending, when you press the "Rank" button, it'll sort by Rank *Descending*. Only if you press the "Rank" button a second time, then it'll sort by Rank Ascending.

![image](https://github.com/user-attachments/assets/65007a39-d352-4da1-af57-56607a2bb025) ![image](https://github.com/user-attachments/assets/a955aaf4-2b55-472f-8c4c-4efd7ca58cf8)

*For clarification: the color coding shows the **next** sorting order that will be applied when you press that button*
### Toggle automatic hand sorting
**Order** introduces a new "Auto" button to the "Sort Hand" area. It toggles autosort on (green) and off (red). When autosort is turned off, new cards drawn won't be automatically sorted. They'll just be placed at the right side of the hand, in the order they're drawn. If autosort is off, the next time you turn it on, it'll sort the hand by the default values you chose in the config.

![image](https://github.com/user-attachments/assets/1e278baf-c87f-44fc-9d96-190eb8c3ada4)  ![image](https://github.com/user-attachments/assets/890aa66c-705d-43e5-af29-f3886d6a5254)

*For clarification: the Auto button color show if the autosort is **currently** on or off*

### Default Values and Configuration
![showcOrder](https://github.com/user-attachments/assets/ea96c318-7623-43de-bd38-d079593a6d56)

**Notes**
- The "Autosort" toggle only changes the default value for the "Auto" button when you start a new run. 
- If you disable the "Auto" button, you won't be able to toggle autosort in-game. It'll just be on if the "Autosort" toggle is on and otherwise off.
- The default sorting method and order will be applied to Arcana / Spectral Booster Packs, even with Autosort off.
