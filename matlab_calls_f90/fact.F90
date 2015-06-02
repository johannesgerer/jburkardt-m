# include <fintrf.h>

subroutine mexFunction ( nlhs, plhs, nrhs, prhs )

!*****************************************************************************80
!
!! MEXFUNCTION is a MATLAB/F90 interface for the factorial function.
!
!  Discussion:
!
!    The MATLAB user types
!
!      y = fact ( x )
!
!    This routine carries out the computation of the factorial of X,
!    whose value is returned in Y.
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

  integer ( kind = 4 ) i
  mwpointer mxCreateDoubleMatrix
  mwpointer mxGetPr
  real ( kind = 8 ) mxGetScalar
  mwpointer plhs(nlhs)
  mwpointer prhs(nrhs)
  real ( kind = 8 ) x
  real ( kind = 8 ) y
  mwpointer y_pointer
!
!  Retrieve the (first) (scalar) input argument from the line
!
! y = fact ( x )
!
  x = mxGetScalar ( prhs(1) )
!
!  Make space for the output argument, and
!  retrieve the value of the pointer to that space.
!
  plhs(1) = mxCreateDoubleMatrix ( 1, 1, 0 )
  y_pointer = mxGetPR ( plhs(1) )
!
!  Compute the value of the output argument.
!
  y = 1.0D+00
  do i = 1, int ( x )
    y = y * real ( i, kind = 8 )
  end do
!
!  Copy the value of Y into the address for the output.
!
  call mxCopyReal8ToPtr ( y, y_pointer, 1 )

  return
end
