function ierror = gray_code_check ( n, t )

%*****************************************************************************80
%
%% GRAY_CODE_CHECK checks a Gray code element.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of digits in each element.
%    N must be positive.
%
%    Input, integer T(N), an element of the Gray code.
%    Each entry T(I) is either 0 or 1.
%
%    Output, integer IERROR, error flag.
%    0, no error, T represents a Gray code element.
%    -1, N is not positive.
%    I, error, T(I) is an illegal value for a Gray code element.
%
  ierror = 0;

  if ( n < 1 )
    ierror = -1;
    return
  end

  for i = 1 : n

    if ( t(i) ~= 0 && t(i) ~= 1 )
      ierror = i;
      return
    end

  end

  return
end
