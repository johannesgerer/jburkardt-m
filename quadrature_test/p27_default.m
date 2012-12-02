function p27_default ( dim_num )

%*****************************************************************************80
%
%% P27_DEFAULT sets default values for problem 27.
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
  p27_i4 ( 'D', '*', i4 );

  r8 = 0.0;
  p27_r8 ( 'D', '*', r8 );

  r8vec = [];
  p27_r8vec ( 'D', '*', dim_num, r8vec );

  return
end
