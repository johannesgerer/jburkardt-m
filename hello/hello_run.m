%% HELLO_RUN is a script file to run HELLO.
%
%    It simply contains direct commands to MATLAB.
%    Using a script file allows you to run a MATLAB M-file indirectly,
%    or in the background.
%
%    For example, you might say:
%
%      matlab < hello_run.m > hello_output.txt &
%
%    MATLAB will read the commands in this file, execute them,
%    and put the output in the output file.  
%
%    Because of the ampersand at the end of the command, MATLAB will
%    run in the background.
%
  disp ( 'HELLO_RUN will run the "hello.m" M file.' )

  tic

  hello

  toc

  disp ( 'HELLO_RUN: Normal end of execution.' )
