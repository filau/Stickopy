class Global {
  List global_copied;

  List get copied {
    return global_copied;
  }

  set copied(List content) {
    this.global_copied = content;
  }
}
