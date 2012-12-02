function value = halham_step_check ( step )

%*****************************************************************************80
%
%% HALHAM_STEP_CHECK checks STEP for a Halton or Hammersley sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer STEP, the step of the leaped subsequence.
%
%    Output, logical VALUE, is true if STEP is legal.
%
  if ( step < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HALHAM_STEP_CHECK - Fatal error!\n' );
    fprintf ( 1, '  Input value of STEP < 0!\n' );
    fprintf ( 1, '  STEP = %d\n', step );
    value = 0;
  else
    value = 1;
  end

  return
end
