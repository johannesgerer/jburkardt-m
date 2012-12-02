function value = r4_huge ( )

%*****************************************************************************80
%
%% R4_HUGE returns a "huge" real number.
%
%  Discussion:
%
%    The value returned by this function is NOT required to be the
%    maximum representable R4.  This value varies from machine to machine,
%    from compiler to compiler, and may cause problems when being printed.
%    We simply want a "very large" but non-infinite number.
%
%    MATLAB provides a built-in symbolic constant "inf" that can be used
%    if a huge number is really what you want!
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real VALUE, a huge number.
%
  value = 1.0E+30;

  return
end

