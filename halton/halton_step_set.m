function halton_step_set ( step )

%*****************************************************************************80
%
%% HALTON_STEP_SET sets the step of the leaped Halton subsequence.
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
%    Input, integer STEP, the step of the leaped Halton subsequence.
%
  global halton_BASE
  global halton_LEAP
  global halton_DIM_NUM
  global halton_SEED
  global halton_STEP

  step = floor ( step );

  if ( ~halham_step_check ( step ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALTON_STEP_SET - Fatal error!\n' );
    error ( 'HALTON_STEP_SET - Fatal error!' );
  end

  halton_STEP = step;

  return
end
