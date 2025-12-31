Linux Gaming Ghost Fix 👻

A lightweight workaround for games freezing when entering fullscreen or losing focus on Linux.

This issue is particularly common with Nvidia GPUs running proprietary drivers and games built on Unreal Engine 4 (e.g., Hellblade: Senua's Sacrifice, Tekken 7, Stray, etc.), where the video output freezes while the audio continues playing.

🧐 The Problem

On specific Linux configurations (such as Linux Mint 21/22 or Ubuntu with Cinnamon/GNOME), the compositor or the GPU driver stops rendering the game window when it requests exclusive fullscreen focus. This causes the image to freeze indefinitely, often requiring a hard kill of the game process.

💡 The Solution

This script acts as a wrapper for your game. It launches a tiny (1x1 pixel), transparent, "Always on Top" terminal window in the background. This "Ghost Window" tricks the compositor into keeping the rendering pipeline active because it detects another window on top of the game, effectively preventing the freeze.

📦 Requirements

You need the following standard packages installed on your system:

wmctrl: To force the ghost window to stay "Always on Top".

x11-utils: Contains xprop, used to make the window transparent (invisible).

gnome-terminal: The standard terminal emulator (default in Ubuntu, Linux Mint, Fedora, etc.).

Install on Debian/Ubuntu/Mint:

sudo apt update
sudo apt install wmctrl x11-utils gnome-terminal -y


🚀 How to Use

1. Get the Script

Download the ghost_runner.sh file from this repository and save it to a permanent location on your PC (for example, in your Home folder or a Scripts folder).

2. Make it Executable

Open your terminal in the folder where you saved the script and run:

chmod +x ghost_runner.sh


3. Configure Steam Launch Options

You don't need to run the script manually every time. Steam can do it for you.

Open your Steam Library.

Right-click on the game that is freezing and select Properties.

In the General tab, locate the Launch Options field.

Enter the full path to the script followed by %command%.

Syntax:

/path/to/your/ghost_runner.sh %command%


Example (if saved in your Home folder):

/home/tomas/ghost_runner.sh %command%


(Make sure to replace tomas with your actual username)

4. Play!

Launch the game from Steam as usual.

The script will automatically start the invisible ghost window.

The game will launch without freezing.

When you exit the game, the script will automatically close the ghost window.

🛠️ Troubleshooting

I see a tiny black dot in the corner:
If xprop is missing or fails, the window won't be transparent, but it will still be a tiny 1x1 pixel window in the bottom-right corner. The fix still works! Just install x11-utils to make it invisible.

Permission Denied:
Ensure you ran the chmod +x ghost_runner.sh command in Step 2.

Game still freezes?
Try running the game in "Windowed" or "Borderless Window" mode in the game's graphics settings, combined with this script.

📄 License

This project is licensed under the MIT License - feel free to use, modify, and share it to help other Linux gamers!
