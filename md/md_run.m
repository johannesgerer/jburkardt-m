%% MD_RUN is a script to run MD with prescribed input.
%
  filename = 'md_output.txt';

  delete ( filename );

  diary ( filename );

  nd = 3;
  np = 500;
  step_num = 500;
  dt = 0.1;

  md ( nd, np, step_num, dt );

  diary ( 'off' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output written to "%s"\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

