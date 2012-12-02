function [ r, seed ] = runs_sample ( m, n, seed )

%*****************************************************************************80
%
%% RUNS_SAMPLE samples the Runs PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the PDF.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer R, the number of runs.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ a, seed ] = runs_simulate ( m, n, seed );

  r = i4vec_run_count ( m+n, a );

  return
end
