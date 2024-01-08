#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""#
#**** Author: Paresh Rohan ****                                      #
#**** Date: 08/01/2024 ****                                          #
#**** Title: "Daily Task Manager" ****                               #
#**** Git Repos: "https://github.com/rohan2468/Project_1.git" ****   #
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""#
# Task Manager Functions
add_task() {
    echo "$1" >> Tasks.txt
}

list_tasks() {
    echo "Tasks:"
    cat -n Tasks.txt
}

complete_task() {
    local task_num=$1
    sed -i "${task_num}d" Tasks.txt
}

# Notes Management Functions
create_note() {
    echo "$1" >> Notes.txt
}

view_notes() {
    echo "Notes:"
    cat Notes.txt
}

# Interactive Menu
show_menu() {
    echo "----- Daily Task Manager Menu -----"
    echo "1. Add New Task"
    echo "2. List All Tasks"
    echo "3. Complete Task"
    echo "4. Create New Note"
    echo "5. View All Notes"
    echo "6. Exit"

    read -p "Enter your choice: " choice
    handle_choice "$choice"
}

handle_choice() {
    case $1 in
        1) read -p "Enter task: " new_task; add_task "$new_task";;
        2) list_tasks;;
        3) read -p "Enter task number to complete: " task_num; complete_task "$task_num";;
        4) read -p "Enter note: " new_note; create_note "$new_note";;
        5) view_notes;;
        6) exit;;
        *) echo "Invalid choice";;
    esac

    show_menu
}

# Main Execution
initialize_files() {
    touch Tasks.txt Notes.txt
}

initialize_files

# Display the initial menu
show_menu