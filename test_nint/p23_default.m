function p23_default ( dim_num )

%*****************************************************************************80
%
%% P23_DEFAULT sets default values for problem 23.
%
%  Discussion:
%
%    If a problem uses vector parameters, then the spatial dimension
%    DIM_NUM is needed as input, so that the vector parameters can be
%    properly dimensioned.
%
%    Every problem keeps a count of the number of function calls.  Calling
%    this routine causes that count to be reset to 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the problem.
%
  i4 = 0;
  p23_i4 ( 'D', '*', i4 );

  r8 = 0.0;
  p23_r8 ( 'D', '*', r8 );

  i4vec = [];
  p23_i4vec ( 'D', '*', dim_num, i4vec );

  return
end
