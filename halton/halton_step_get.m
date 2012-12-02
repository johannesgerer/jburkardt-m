function step = halton_step_get ( )

%*****************************************************************************80
%
%% HALTON_STEP_GET gets the "step" of the leaped Halton subsequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer STEP, the step of the leaped Halton subsequence.
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  step = halton_STEP;

  if ( ~halham_step_check ( step ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_STEP_GET - Fatal error!\n' );
    error ( 'HALTON_STEP_GET - Fatal error!' );
  end

  return
end
