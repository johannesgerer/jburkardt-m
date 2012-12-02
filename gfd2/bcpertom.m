function f = bcpertom ( f )

%*****************************************************************************80
%
%% BCPERTOM makes a copy of an array with certain "boundary conditions".
%
%  Discussion:
%
%    The output array is a copy of the input array, except that
%    row M-1 was copied to row 1, row 2 was copied to row M, and columns
%    1 and N were zeroed out.  This is suggested by the following diagram:
%
%     52 52 53 54 55 55   <- Row M-1 copied here
%     22 22 23 24 25 25
%     32 32 33 34 35 35
%     42 42 43 44 45 45
%     52 52 53 54 55 55
%     22 22 23 24 25 25   <- Row 2 copied here
%
%     Column 2 copied into column 1;
%     Column N-1 copied into column N.
%
%    This function is discussed in chapter 17 of the reference.
%
%  Modified:
%
%    02 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%
%    Input, real F(M,N), the array to be modified.
%
%    Output, real F(M,N), the modified array.
%
  val = size(f);
  M = val(1);
  N = val(2);

  f(1,:) = f(M-1,:);
  f(:,1) = f(:,2);
  f(M,:) = f(2,:);
  f(:,N) = f(:,N-1);

  return
end
