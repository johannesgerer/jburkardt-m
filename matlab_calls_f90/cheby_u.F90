# include <fintrf.h>

subroutine mexFunction ( nlhs, plhs, nrhs, prhs )

!*****************************************************************************80
!
!! MEXFUNCTION is a MATLAB/F77 interface for the Chebyshev U polynomial.
!
!  Discussion:
!
!    This file should be called "cheby_u.F90".  It should be placed in the
!    MATLAB user's path.  It can be compiled externally, with a
!    command like
!
!      mex cheby_u.F90
!
!    creating a compiled MEX file, or inside of MATLAB, the command
!
!      mex cheby_u.F90
!
!    accomplishes the same task.  Once the file has been compiled,
!    the MATLAB user can invoke the function by typing:
!
!      cx = cheby_u ( n, x )
!
!    This routine computes the N+1 values of the Chebyshev U polynomials
!    of order 0 through N at the point X, returning the values in CX(1)
!    through CX(N+1).
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license.
!
!  Modified:
!
!    30 September 2013
!
!  Author:
!
!    John Burkardt
!
!  Reference:
!
!    Duane Hanselman, Bruce Littlefield,
!    Mastering MATLAB 7,
!    Pearson Prentice Hall, 2005,
!    ISBN: 0-13-143018-1.
!
!    The Mathworks,
!    MATLAB External Interfaces,
!    The Mathworks, 2000.
!
!  Parameters:
!
!    Input, integer ( kind = 4 ) NLHS, the number of output arguments.
!
!    Input, mwpointer PLHS(NLHS), pointers to the output arguments.
!
!    Input, integer ( kind = 4 ) NRHS, the number of input arguments.
!
!    Input, mwpointer PRHS(NRHS), pointers to the input arguments.
!
  implicit none

  integer ( kind = 4 ) nlhs
  integer ( kind = 4 ) nrhs

  real ( kind = 8 ) cx(1001)
  mwpointer cx_pointer
  mwpointer mxCreateDoubleMatrix
  mwpointer mxGetPr
  real ( kind = 8 ) mxGetScalar
  integer ( kind = 4 ) n
  mwpointer plhs(nlhs)
  mwpointer prhs(nrhs)
  real ( kind = 8 ) x
!
!  GET INPUT:
!    From the command line
!      cx = cheby_u ( n, x )
!    retrieve the first scalar integer input argument N,
!    and the second scalar real input argument X.
!
  n = mxGetScalar ( prhs(1) )
  x = mxGetScalar ( prhs(2) )

  if ( 1000 < n ) then
    call mexErrMsgTxt ( 'N must be <= 1000.' )
  end if
!
!  MAKE ROOM FOR OUTPUT:
!    Make space for the output argument,
!    and copy the pointer to that space.
!
  plhs(1) = mxCreateDoubleMatrix ( n+1, 1, 0 )
  cx_pointer = mxGetPr ( plhs(1) )
!
!  COMPUTATION:
!    Call the FORTRAN90 routine with the input and output arguments.
!
  call cheby_u ( n, x, cx )
!
!  Copy the output to where MATLAB expects it to be.
!
  call mxCopyReal8ToPtr ( cx, cx_pointer, n+1 )

  return
end
subroutine cheby_u ( n, x, cx )

!*****************************************************************************80
!
!! CHEBY_U evaluates the Chebyshev polynomials of the second kind.
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license.
!
!  Modified:
!
!    28 September 2013
!
!  Author:
!
!    John Burkardt
!
!  Reference:
!
!    Milton Abramowitz and Irene Stegun,
!    Handbook of Mathematical Functions,
!    US Department of Commerce, 1964.
!
!  Parameters:
!
!    Input, integer ( kind = 4 ) N, the highest polynomial to compute.
!
!    Input, real ( kind = 8 ) X, the point at which the polynomials
!    are to be computed.
!
!    Output, real ( kind = 8 ) CX(N+1), the values of the N+1 Chebyshev
!    polynomials.
!
  implicit none

  integer ( kind = 4 ) n

  real ( kind = 8 ) cx(n+1)
  integer ( kind = 4 ) i
  real ( kind = 8 ) x

  if ( n < 0 ) then
    return
  end if

  cx(1) = 1.0D+00

  if ( n < 1 ) then
    return
  end if

  cx(2) = 2.0D+00 * x

  do i = 2, n
    cx(i+1) = 2.0D+00 * x * cx(i) - cx(i-1)
  end do

  return
end
