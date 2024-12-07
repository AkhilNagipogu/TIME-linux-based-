import tkinter as tk
import time

# Function to update the time every second
def update_time():
    current_time = time.strftime('%H:%M:%S')
    label.config(text=current_time)
    # Update the time every 1000ms (1 second)
    root.after(1000, update_time)

# Create the main window
root = tk.Tk()

# Set the window title
root.title("Time Display")

# Set the background color to black
root.config(bg="black")

# Set the window to be resizable
root.resizable(True, True)

# Create a label to display the time
label = tk.Label(root, font=("Helvetica", 48), fg="white", bg="black")
label.pack(expand=True)

# Call the update_time function to start the clock
update_time()

# Start the Tkinter main loop
root.mainloop()
