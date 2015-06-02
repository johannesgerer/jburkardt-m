%% MD_FAST_RUN is a script to run MD_FAST with prescribed input.
%
  filename = 'md_fast_output.txt';

  delete ( filename );

  diary ( filename );

  nd = 3;
  np = 500;
  step_num = 500;

  md_fast ( nd, np, step_num );

  diary ( 'off' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Output written to "%s"\n', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

