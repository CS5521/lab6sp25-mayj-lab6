#include "types.h"
#include "user.h"

int main() {
  int before, after, cleaned, thirdTest;
  before = fkc(1);
  printf(1, "number of forks when program starts: %d\n", before);
  
  //Parent process calls fork twice
  //Child process do nothing other than exit
  if (fork() == 0) exit();
  if (fork() == 0) exit();

  
  //The parent process calls wait twice
  //To reap the two child processes that were created.
  wait();
  wait();


  //Call fkc again
  after = fkc(1);
  printf(1, "number of forks after two more forks: %d\n", after);
  
  //Testing clean fkc
  cleaned = fkc(0);
  printf(1, "number of forks after fork count cleared: %d\n", cleaned);
  
  //Call fkc after forking three times
  if (fork() == 0) exit();
  if (fork() == 0) exit();
  if (fork() == 0) exit();

  //Reap all the child processes to avoid zombies
  wait();
  wait();
  wait();

  //Testing three forks
  thirdTest = fkc(1);
  printf(1, "number of forks after three more forks: %d\n", thirdTest);

  exit();
}
