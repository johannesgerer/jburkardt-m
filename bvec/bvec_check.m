function ierror = bvec_check ( n, ivec )

%*****************************************************************************80
%
%% BVEC_CHECK checks a binary vector.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2**(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%    The only check made is that the entries are all 0 or 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the length of the vectors.
%
%    Input, integer IVEC(N), the vector to be checked.
%
%    Output, integer IERROR, is nonzero if an error occurred.
%
  ierror = 0;

  for i = 1 : n
    if ( ivec(i) ~= 0 & ivec(i) ~= 1 )
      ierror = i;
      return
    end
  end

  return
end
