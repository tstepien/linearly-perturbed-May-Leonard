!----------------------------------------------------------------------
!----------------------------------------------------------------------
!   mlm2.f90 - May-Leonard with mutations
!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE FUNC(NDIM,U,ICP,PAR,IJAC,F,DFDU,DFDP)
!--------- ----

! Evaluates the algebraic equations or ODE right hand side

! Input arguments :
!      NDIM   :   Dimension of the algebraic or ODE system 
!      U      :   State variables
!      ICP    :   Array indicating the free parameter(s)
!      PAR    :   Equation parameters

! Values to be returned :
!      F      :   Equation or ODE right hand side values

! Normally unused Jacobian arguments : IJAC, DFDU, DFDP (see manual)

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM, IJAC, ICP(*)
  DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
  DOUBLE PRECISION, INTENT(OUT) :: F(NDIM)
  DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM,NDIM),DFDP(NDIM,*)

  DOUBLE PRECISION m1, m2, m3, mu, alpha, beta

  m1 = U(1)
  m2 = U(2)
  m3 = U(3)
  beta = PAR(1)
  alpha = PAR(2)
  mu = PAR(3)

  F(1)= m1*(1 -m1 -alpha*m2 -beta*m3) + mu*(m2 -2*m1 + m3)
  F(2)= m2*(1 -beta*m1 -m2 -alpha*m3) + mu*(m1 -2*m2 + m3)
  F(3)= m3*(1 -alpha*m1 -beta*m2 -m3) + mu*(m1 +m2 -2*m3)


END SUBROUTINE FUNC

!-----------------------------------------------------------------------
!-----------------------------------------------------------------------

SUBROUTINE STPNT(NDIM,U,PAR,T)
!--------- -----

! Input arguments :
!      NDIM   :   Dimension of the algebraic or ODE system 

! Values to be returned :
!      U      :   A starting solution vector
!      PAR    :   The corresponding equation-parameter values

! Note : For time- or space-dependent solutions this subroutine has
!        the scalar input parameter T contains the varying time or space
!        variable value.
  
  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM
  DOUBLE PRECISION, INTENT(INOUT) :: U(NDIM),PAR(*)
  DOUBLE PRECISION, INTENT(IN) :: T

! Initialize the equation parameters
!PAR(1:3) = (/ 0.0, 1.45d0, 0.04d0 /)
PAR(1) = 0.5d0
PAR(2) = 2.5d0
PAR(3) = 0.5d0

! Initialize the solution
U(1) = -0.389616876015175d0
U(2) = -0.052268605687923d0
U(3) = 0.329367675399159d0



!PAR(1) = 1.5d0
!PAR(2) = 1.2d0
!PAR(3) = 0.6d0
!U(1) = -0.469775747041418d0
!U(2) = -1.021147237780143d0
!U(3) = 1.007979890603869d0



   
END SUBROUTINE STPNT

!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE BCND(NDIM,PAR,ICP,NBC,U0,U1,FB,IJAC,DBC)
!--------- ----

! Boundary Conditions

! Input arguments :
!      NDIM   :   Dimension of the ODE system 
!      PAR    :   Equation parameters
!      ICP    :   Array indicating the free parameter(s)
!      NBC    :   Number of boundary conditions
!      U0     :   State variable values at the left boundary
!      U1     :   State variable values at the right boundary

! Values to be returned :
!      FB     :   The values of the boundary condition functions 

! Normally unused Jacobian arguments : IJAC, DBC (see manual)

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM, ICP(*), NBC, IJAC
  DOUBLE PRECISION, INTENT(IN) :: PAR(*), U0(NDIM), U1(NDIM)
  DOUBLE PRECISION, INTENT(OUT) :: FB(NBC)
  DOUBLE PRECISION, INTENT(INOUT) :: DBC(NBC,*)

!X FB(1)=
!X FB(2)=

END SUBROUTINE BCND

!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE ICND(NDIM,PAR,ICP,NINT,U,UOLD,UDOT,UPOLD,FI,IJAC,DINT)
!--------- ----

! Integral Conditions

! Input arguments :
!      NDIM   :   Dimension of the ODE system 
!      PAR    :   Equation parameters
!      ICP    :   Array indicating the free parameter(s)
!      NINT   :   Number of integral conditions
!      U      :   Value of the vector function U at `time' t

! The following input arguments, which are normally not needed,
! correspond to the preceding point on the solution branch
!      UOLD   :   The state vector at 'time' t
!      UDOT   :   Derivative of UOLD with respect to arclength
!      UPOLD  :   Derivative of UOLD with respect to `time'

! Normally unused Jacobian arguments : IJAC, DINT

! Values to be returned :
!      FI     :   The value of the vector integrand 

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM, ICP(*), NINT, IJAC
  DOUBLE PRECISION, INTENT(IN) :: PAR(*)
  DOUBLE PRECISION, INTENT(IN) :: U(NDIM), UOLD(NDIM), UDOT(NDIM), UPOLD(NDIM)
  DOUBLE PRECISION, INTENT(OUT) :: FI(NINT)
  DOUBLE PRECISION, INTENT(INOUT) :: DINT(NINT,*)

!X FI(1)=

END SUBROUTINE ICND

!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE FOPT(NDIM,U,ICP,PAR,IJAC,FS,DFDU,DFDP)
!--------- ----
!
! Defines the objective function for algebraic optimization problems
!
! Supplied variables :
!      NDIM   :   Dimension of the state equation
!      U      :   The state vector
!      ICP    :   Indices of the control parameters
!      PAR    :   The vector of control parameters
!
! Values to be returned :
!      FS      :   The value of the objective function
!
! Normally unused Jacobian argument : IJAC, DFDP

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM, ICP(*), IJAC
  DOUBLE PRECISION, INTENT(IN) :: U(NDIM), PAR(*)
  DOUBLE PRECISION, INTENT(OUT) :: FS
  DOUBLE PRECISION, INTENT(INOUT) :: DFDU(NDIM),DFDP(*)

!X FS=

END SUBROUTINE FOPT

!----------------------------------------------------------------------
!----------------------------------------------------------------------

SUBROUTINE PVLS(NDIM,U,PAR)
!--------- ----

  IMPLICIT NONE
  INTEGER, INTENT(IN) :: NDIM
  DOUBLE PRECISION, INTENT(IN) :: U(NDIM)
  DOUBLE PRECISION, INTENT(INOUT) :: PAR(*)

!---------------------------------------------------------------------- 
! NOTE : 
! Parameters set in this subroutine should be considered as ``solution 
! measures'' and be used for output purposes only.
! 
! They should never be used as `true'' continuation parameters. 
!
! They may, however, be added as ``over-specified parameters'' in the 
! parameter list associated with the AUTO-Constant NICP, in order to 
! print their values on the screen and in the ``p.xxx file.
!
! They may also appear in the list associated with AUTO-Constant NUZR.
!
!---------------------------------------------------------------------- 
! For algebraic problems the argument U is, as usual, the state vector.
! For differential equations the argument U represents the approximate 
! solution on the entire interval [0,1]. In this case its values must 
! be accessed indirectly by calls to GETP, as illustrated below.
!---------------------------------------------------------------------- 
!
! Set PAR(2) equal to the L2-norm of U(1)
!X PAR(2)=GETP('NRM',1,U)
!
! Set PAR(3) equal to the minimum of U(2)
!X PAR(3)=GETP('MIN',2,U)
!
! Set PAR(4) equal to the value of U(2) at the left boundary.
!X PAR(4)=GETP('BV0',2,U)
!
! Set PAR(5) equal to the pseudo-arclength step size used.
!X PAR(5)=GETP('STP',1,U)
!
!---------------------------------------------------------------------- 
! The first argument of GETP may be one of the following:
!        'NRM' (L2-norm),     'MAX' (maximum),
!        'INT' (integral),    'BV0 (left boundary value),
!        'MIN' (minimum),     'BV1' (right boundary value).
!
! Also available are
!   'STP' (Pseudo-arclength step size used).
!   'FLD' (`Fold function', which vanishes at folds).
!   'BIF' (`Bifurcation function', which vanishes at singular points).
!   'HBF' (`Hopf function'; which vanishes at Hopf points).
!   'SPB' ( Function which vanishes at secondary periodic bifurcations).
!---------------------------------------------------------------------- 


END SUBROUTINE PVLS

!----------------------------------------------------------------------
!----------------------------------------------------------------------
