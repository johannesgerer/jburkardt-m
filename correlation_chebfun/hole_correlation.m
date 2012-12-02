function K = hole_correlation ( s, t )

%*****************************************************************************80
%
%% HOLE_CORRELATION evaluates the hole correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2012
%
%  Author:
%
%    John Burkardt
%
  d = abs ( s - t );

  K = ( 1 - d ) .* exp ( - d );

  return
end
