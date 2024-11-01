# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()


# class trash_put_confirm(Command):
#     """
#     :trash_put_confirm
#     Prompts for confirmation to move selected files to trash.
#     """
#
#     def execute(self):
#         files = self.fm.thistab.get_selection()
#         file_names = ", ".join([f.relative_path for f in files])
#         self.fm.notify(
#             f"Are you sure you want to trash: {file_names}? [y/N]", bad=True)
#         self.fm.open_console("trash_put_confirm_confirm ")
#

# class trash_put_confirm(Command):
#     """
#     :trash_put_confirm
#     Prompts for confirmation to move selected files to trash.
#     """
#
#     def execute(self):
#         files = self.fm.thistab.get_selection()
#         file_names = ", ".join([f.relative_path for f in files])
#         self.fm.notify(
#             f"Are you sure you want to trash: {file_names}? Type 'y' for Yes or 'n' for No.", bad=True)
#         self.fm.open_console("trash_put_confirm_confirm")
#
#
# class trash_put_confirm_confirm(Command):
#     def execute(self):
#         if self.arg(1) == "y":
#             files = self.fm.thistab.get_selection()
#             for f in files:
#                 self.fm.execute_console(f"shell trash-put '{f.path}'")
#             self.fm.notify("Files moved to trash.")
#         else:
#             self.fm.notify("Cancelled.")
#
#
# class trash_put_confirm(Command):
#     """
#     :trash_put_confirm
#     Prompts for confirmation to move selected files to trash.
#     """
#
#     def execute(self):
#         # Get selected files and prepare the prompt message
#         files = self.fm.thistab.get_selection()
#         file_names = ", ".join([f.relative_path for f in files])
#
#         # Open the console with a prompt, but no command name
#         self.fm.open_console(
#             f"Are you sure you want to trash: {file_names}? Type 'y' for Yes or 'n' for No: ",
#             position=0,
#             prompt=""
#         )
#
#     def tab(self, tabnum):
#         # Capture the user's response
#         answer = self.arg(1).strip().lower()
#
#         # Check the response and proceed accordingly
#         if answer == "y":
#             # Move selected files to trash
#             files = self.fm.thistab.get_selection()
#             for f in files:
#                 self.fm.execute_console(f"shell trash-put '{f.path}'")
#             self.fm.notify("Files moved to trash.")
#         elif answer == "n":
#             # Operation canceled
#             self.fm.notify("Cancelled.")
#         else:
#             # Invalid input; re-prompt or handle accordingly
#             self.fm.notify(
#                 "Invalid input. Please press 'y' to confirm or 'n' to cancel.", bad=True)
#
#

class trash_put_confirm(Command):
    """
    :trash_put_confirm
    Prompts for confirmation to move selected files to trash.
    """

    def execute(self):
        # Get selected files and create a display message
        files = self.fm.thistab.get_selection()
        file_names = ", ".join([f.relative_path for f in files])

        # Display confirmation prompt and await user input (y/n)
        self.fm.notify(
            f"Are you sure you want to trash: {file_names}? Type 'y' to confirm or 'n' to cancel.", bad=True)
        self.fm.open_console("trash_put_confirm_response ")


class trash_put_confirm_response(Command):
    def execute(self):
        # Process response based on user input
        answer = self.arg(1).strip().lower()

        if answer == "y":
            # Move files to trash
            files = self.fm.thistab.get_selection()
            for f in files:
                self.fm.execute_console(f"shell trash-put '{f.path}'")
            self.fm.notify("Files moved to trash.")
        else:
            # Cancel operation
            self.fm.notify("Cancelled.")
