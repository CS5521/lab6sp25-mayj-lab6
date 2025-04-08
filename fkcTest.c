#include "types.h"
#include "user.h"

int main() {
  int before, after;
  before = fkc();
  printf(1, "numnber of forks when program starts: %d\n", before);
  
  //Parent process calls fork twice
  //Child process do nothing other than exit
  if (fork() == 0) exit();
  if (fork() == 0) exit();

  
  //The parent process calls wait twice
  //To reap the two child processes that were created.
  wait();
  wait();


  //Call fkc again
  after = fkc();
  printf(1, "number of forks after two more forks: %d\n", after);
  
  exit();
}
