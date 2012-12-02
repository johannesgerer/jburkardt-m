function check = geometric_check ( a )

%*****************************************************************************80
%
%% GEOMETRIC_CHECK checks the parameter of the Geometric CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the probability of success on one trial.
%    0.0 <= A <= 1.0.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 0.0 | 1.0 < a )
    fprintf ( 1, '\n');
    fprintf ( 1, 'GEOMETRIC_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 0 or 1 < A.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
