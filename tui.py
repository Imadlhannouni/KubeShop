#!/usr/bin/env python3
import os
import subprocess
import time
from rich.console import Console
from rich.markdown import Markdown
from rich.panel import Panel
from rich.table import Table
from rich.prompt import Prompt, IntPrompt
from rich.layout import Layout
from rich.live import Live

console = Console()

LABS_DIR = "labs"

def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

def get_labs():
    labs = []
    if not os.path.exists(LABS_DIR):
        return []
    
    for d in sorted(os.listdir(LABS_DIR)):
        path = os.path.join(LABS_DIR, d)
        if os.path.isdir(path):
            labs.append({
                "name": d,
                "path": path,
                "instructions": os.path.join(path, "instructions.md"),
                "check": os.path.join(path, "check.sh")
            })
    return labs

def run_check(lab):
    check_script = lab["check"]
    if not os.path.exists(check_script):
        return False, "No check script found."
    
    try:
        result = subprocess.run([check_script], capture_output=True, text=True, timeout=10)
        return result.returncode == 0, result.stdout + result.stderr
    except Exception as e:
        return False, str(e)

def show_instructions(lab):
    clear_screen()
    if not os.path.exists(lab["instructions"]):
        console.print(f"[red]No instructions found for {lab['name']}[/red]")
        Prompt.ask("Press Enter to return")
        return

    with open(lab["instructions"], "r") as f:
        md = Markdown(f.read())
    
    console.print(Panel(md, title=f"📘 {lab['name']} - Instructions", border_style="blue"))
    Prompt.ask("\nPress Enter to return to menu")

def show_verification(lab):
    clear_screen()
    console.print(f"[bold]Running verification for {lab['name']}...[/bold]")
    
    with console.status("[bold green]Verifying...[/bold green]"):
        time.sleep(1) # Fake delay for effect
        success, output = run_check(lab)
    
    color = "green" if success else "red"
    title = "✅ Passed!" if success else "❌ Failed"
    
    console.print(Panel(output, title=f"{title}", border_style=color))
    
    if success:
        console.print("\n[bold green]Great job! You are ready for the next lab.[/bold green]")
    else:
        console.print("\n[bold red]Something is wrong. Read the error above and try again.[/bold red]")
    
    Prompt.ask("\nPress Enter to return to menu")

def main_menu():
    while True:
        clear_screen()
        labs = get_labs()
        
        table = Table(title="🚀 KubeShop Learning Labs", border_style="cyan")
        table.add_column("#", style="cyan", no_wrap=True)
        table.add_column("Lab Name", style="white")
        table.add_column("Action", style="dim")

        for idx, lab in enumerate(labs):
            table.add_row(str(idx + 1), lab["name"], "Select to View/Verify")

        console.print(table)
        console.print("\n[dim]Enter the lab number to open, or 'q' to quit.[/dim]")
        
        choice = Prompt.ask("Select Lab", default="q")
        
        if choice.lower() == 'q':
            console.print("[bold]Happy Kuberneting! 👋[/bold]")
            break
            
        try:
            selection = int(choice) - 1
            if 0 <= selection < len(labs):
                lab_menu(labs[selection])
            else:
                console.print("[red]Invalid selection[/red]")
                time.sleep(1)
        except ValueError:
            pass

def lab_menu(lab):
    while True:
        clear_screen()
        console.print(Panel(f"[bold cyan]{lab['name']}[/bold cyan]", border_style="cyan"))
        console.print("1. [bold blue]📖 Read Instructions[/bold blue]")
        console.print("2. [bold green]✅ Run Verification[/bold green]")
        console.print("3. [dim]🔙 Back to Main Menu[/dim]")
        
        choice = IntPrompt.ask("Choose action", choices=["1", "2", "3"])
        
        if choice == 1:
            show_instructions(lab)
        elif choice == 2:
            show_verification(lab)
        elif choice == 3:
            break

if __name__ == "__main__":
    try:
        main_menu()
    except KeyboardInterrupt:
        print("\nExiting...")
