function bvec_print ( n, bvec, title )

%*****************************************************************************80
%
%% BVEC_PRINT prints a binary integer vector, with an optional title.
%
%  Discussion:
%
%    A BVEC is an integer vector of binary digits, intended to
%    represent an integer.  BVEC(1) is the units digit, BVEC(N-1)
%    is the coefficient of 2**(N-2), and BVEC(N) contains sign
%    information.  It is 0 if the number is positive, and 1 if
%    the number is negative.
%
%    The vector is printed "backwards", that is, the first entry
%    printed is BVEC(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, integer BVEC(N), the vector to be printed.
%
%    Input, character ( len = * ) TITLE, a title to be printed first.
%    TITLE may be blank.
%
  if ( 0 < s_len_trim ( title ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '%s\n', title );
    fprintf ( 1, '\n' );
  end

  for ihi = n : -80 : 1
    ilo = max ( ihi - 80 + 1, 1 );
    for i = ihi : -1 : ilo
      fprintf ( 1, '%1d', bvec(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
