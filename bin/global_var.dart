//  global_var.dart

//   Copyright (C) 2021  Firmin Launay (FLA Coding)

//   This program is distributed under the version 3 of the GNU General Public
// License (<https://www.gnu.org/licenses/>).

class Global {
  List global_copied = [];

  List get copied {
    return global_copied;
  }

  set copied(List content) {
    this.global_copied = content;
  }
}
