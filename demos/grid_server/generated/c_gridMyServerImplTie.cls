VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_gridMyServerImplTie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: ../demos/grid/grid.idl
'Target File Name: c_gridMyServerImplTie.cls

Option Explicit

'You can use this class as a tie to your servant or as a servant example.
'Using as a tie:
' Your servant has to implement c_gridMyServer
' To activate a servant via tie write following:
'  Dim ogridMyServerImplTie As c_gridMyServerImplTie
'  Set ogridMyServerImplTie = New c_gridMyServerImplTie
'  Call ogridMyServerImplTie.setDelegate(oServant)
'  Call oOrb.Connect(ogridMyServerImplTie)
'Using as a servant example:
' Rename class to c_gridMyServerImpl and save the file as c_gridMyServerImpl.cls.
' Remove delegate stuff and write your own servant operations.
' To activate a servant write following:
'  Dim ogridMyServerImpl As c_gridMyServerImpl
'  Set ogridMyServerImpl = New c_gridMyServerImpl
'  Call oOrb.Connect(ogridMyServerImpl)

Implements cOrbSkeleton
Implements c_gridMyServer

'interface ::grid::MyServer
Const sTypeId As String = "IDL:grid/MyServer:1.0"
Private oObjRef As cOrbObjRef
Private oDelegate As c_gridMyServer

'Each tie contains a delegate object, to which all operations are forwarded.
'You can remove this if you use this class as an example for your servant.
Public Sub setDelegate(ByVal Delegate As c_gridMyServer)
    Set oDelegate = Delegate
End Sub

Public Function getDelegate() As c_gridMyServer
    Set getDelegate = oDelegate
End Function

Friend Property Get ObjRef() As cOrbObjRef
    Set ObjRef = oObjRef
End Property

Friend Property Get This() As c_gridMyServer
    Dim oObj As cOrbObject
    Set oObj = New c_gridMyServer
    If oObj.setObjRef(oObjRef, False) Then
        Set This = Nothing
    Else
        Set This = oObj
    End If
End Property

Private Property Get cOrbSkeleton_TypeId(ByVal Item As Integer) As String
    Select Case Item
    Case 0: cOrbSkeleton_TypeId = sTypeId
    Case 1: cOrbSkeleton_TypeId = "IDL:omg.org/CORBA/Object:1.0"
    End Select
End Property

Private Property Get cOrbSkeleton_ObjRef() As cOrbObjRef
    Set cOrbSkeleton_ObjRef = oObjRef
End Property

Private Property Set cOrbSkeleton_ObjRef(ByVal newObjRef As cOrbObjRef)
    Set oObjRef = newObjRef
End Property

'Helper
Private Function cOrbSkeleton_execute(ByVal sOperation As String, _
    ByVal oIn As cOrbStream, ByVal oOut As cOrbStream) As Long
    On Error GoTo ErrHandler
    Dim oImpl_ As c_gridMyServer
    Set oImpl_ = IIf(oDelegate Is Nothing, Me, oDelegate)
    Select Case sOperation
    Case "_get_test1"
        Dim test1 As c_IntegerArr4
        Set test1 = oImpl_.test1()
        Call test1.writeMe(oOut)
    Case "_set_test1"
        Dim test1New As c_IntegerArr4
        Set test1New = New c_IntegerArr4
        Call test1New.initByRead(oIn)
        Set oImpl_.test1() = test1New
    Case "_get_test2"
        Dim test2 As c_IntegerArr4Arr5
        Set test2 = oImpl_.test2()
        Call test2.writeMe(oOut)
    Case "_set_test2"
        Dim test2New As c_IntegerArr4Arr5
        Set test2New = New c_IntegerArr4Arr5
        Call test2New.initByRead(oIn)
        Set oImpl_.test2() = test2New
    Case "_get_height"
        Dim height As Integer
        height = oImpl_.height()
        Call oOut.writeShort(height)
    Case "_get_width"
        Dim width As Integer
        width = oImpl_.width()
        Call oOut.writeShort(width)
    Case "set"
        Dim a1_n As Integer
        a1_n = oIn.readShort()
        Dim a1_m As Integer
        a1_m = oIn.readShort()
        Dim a1_value As Long
        a1_value = oIn.readLong()
        Call oImpl_.setSub(a1_n, a1_m, a1_value)
    Case "get"
        Dim a2_n As Integer
        a2_n = oIn.readShort()
        Dim a2_m As Integer
        a2_m = oIn.readShort()
        Dim getFunc As Long
        getFunc = oImpl_.getFunc(a2_n, a2_m)
        Call oOut.writeLong(getFunc)
    Case "opWithException"
        Dim opWithException As Integer
        opWithException = oImpl_.opWithException()
        Call oOut.writeShort(opWithException)
    Case "shutdownServer"
        Call oImpl_.shutdownServer
    Case Else
        Call VBOrb.raiseBADOPERATION(1, VBOrb.CompletedNO, sOperation)
    End Select
    cOrbSkeleton_execute = 0 'NO_EXCEPTION
    Exit Function
UserExWriter:
    Call VBOrb.getException().writeMe(oOut)
    cOrbSkeleton_execute = 1 'USER_EXCEPTION
    Exit Function
ErrHandler:
    If VBOrb.ErrIsUserEx() Then Resume UserExWriter
    Call VBOrb.ErrReraise(Err, "MyServer.execute(" & sOperation & ")")
End Function

'Implements c_gridMyServer

'attribute test1
Private Property Get c_gridMyServer_test1() As c_IntegerArr4
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_gridMyServer_test1 = oDelegate.test1
    End If
    Exit Property
ErrHandler:
    Set c_gridMyServer_test1 = Nothing
    Call VBOrb.ErrReraise(Err, "test1.Get")
End Property

Private Property Set c_gridMyServer_test1(ByVal test1New As c_IntegerArr4)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set oDelegate.test1 = test1New
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "test1.Set")
End Property

'attribute test2
Private Property Get c_gridMyServer_test2() As c_IntegerArr4Arr5
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_gridMyServer_test2 = oDelegate.test2
    End If
    Exit Property
ErrHandler:
    Set c_gridMyServer_test2 = Nothing
    Call VBOrb.ErrReraise(Err, "test2.Get")
End Property

Private Property Set c_gridMyServer_test2(ByVal test2New As c_IntegerArr4Arr5)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set oDelegate.test2 = test2New
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "test2.Set")
End Property

'readonly attribute height
Private Property Get c_gridMyServer_height() As Integer
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        c_gridMyServer_height = oDelegate.height
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "height.Get")
End Property

'readonly attribute width
Private Property Get c_gridMyServer_width() As Integer
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        c_gridMyServer_width = oDelegate.width
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "width.Get")
End Property

'set()
Private Sub c_gridMyServer_setSub(ByVal n As Integer, ByVal m As Integer, _
    ByVal value As Long)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Call oDelegate.setSub(n, m, value)
    End If
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "setSub")
End Sub

'get()
Private Function c_gridMyServer_getFunc(ByVal n As Integer, ByVal m As Integer) _
    As Long
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        c_gridMyServer_getFunc = oDelegate.getFunc(n, m)
    End If
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "getFunc")
End Function

'opWithException() raises(c_gridMyServerMyException)
Private Function c_gridMyServer_opWithException() As Integer
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        c_gridMyServer_opWithException = oDelegate.opWithException()
    End If
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "opWithException")
End Function

'oneway shutdownServer()
Private Sub c_gridMyServer_shutdownServer()
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Call oDelegate.shutdownServer
    End If
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "shutdownServer")
End Sub