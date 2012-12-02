function value = r8_fraction ( i, j )

%*****************************************************************************80
%
%% R8_FRACTION uses real arithmetic on an integer ratio.
%
%  Discussion:
%
%    Given integer variables I and J, both FORTRAN and C will evaluate 
%    an expression such as "I/J" using what is called "integer division",
%    with the result being an integer.  It is often convenient to express
%    the parts of a fraction as integers but expect the result to be computed
%    using real arithmetic.  This function carries out that operation.
%
%  Example:
%
%       I     J   I/J  R8_FRACTION
%
%       1     2     0  0.5
%       7     4     1  1.75
%       8     4     2  2.00
%       9     4     2  2.25
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the arguments.
%
%    Output, real R8_FRACTION, the value of the ratio.
%
  r8_fraction = i / j;

  return
end
