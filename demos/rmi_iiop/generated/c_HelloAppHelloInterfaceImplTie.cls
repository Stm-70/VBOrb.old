VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "c_HelloAppHelloInterfaceImplTie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Generated by IDL2VB v121. Copyright (c) 1999-2003 Martin.Both
'Source File Name: jdk1.4/idl/HelloApp/HelloInterface.idl
'Target File Name: c_HelloAppHelloInterfaceImplTie.cls

Option Explicit

'You can use this class as a tie to your servant or as a servant example.
'Using as a tie:
' Your servant has to implement c_HelloAppHelloInterface
' To activate a servant via tie write following:
'  Dim oHelloAppHelloInterfaceImplTie As c_HelloAppHelloInterfaceImplTie
'  Set oHelloAppHelloInterfaceImplTie = New c_HelloAppHelloInterfaceImplTie
'  Call oHelloAppHelloInterfaceImplTie.setDelegate(oServant)
'  Call oOrb.Connect(oHelloAppHelloInterfaceImplTie)
'Using as a servant example:
' Rename class to c_HelloAppHelloInterfaceImpl and save the file as c_HelloAppHelloInterfaceImpl.cls.
' Remove delegate stuff and write your own servant operations.
' To activate a servant write following:
'  Dim oHelloAppHelloInterfaceImpl As c_HelloAppHelloInterfaceImpl
'  Set oHelloAppHelloInterfaceImpl = New c_HelloAppHelloInterfaceImpl
'  Call oOrb.Connect(oHelloAppHelloInterfaceImpl)

Implements cOrbSkeleton
Implements c_HelloAppHelloInterface

'interface ::HelloApp::HelloInterface
Const sTypeId As String = "RMI:HelloApp.HelloInterface:0000000000000000"
Private oObjRef As cOrbObjRef
Private oDelegate As c_HelloAppHelloInterface

'Each tie contains a delegate object, to which all operations are forwarded.
'You can remove this if you use this class as an example for your servant.
Public Sub setDelegate(ByVal Delegate As c_HelloAppHelloInterface)
    Set oDelegate = Delegate
End Sub

Public Function getDelegate() As c_HelloAppHelloInterface
    Set getDelegate = oDelegate
End Function

Friend Property Get ObjRef() As cOrbObjRef
    Set ObjRef = oObjRef
End Property

Friend Property Get This() As c_HelloAppHelloInterface
    Dim oObj As cOrbObject
    Set oObj = New c_HelloAppHelloInterface
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
    Dim oImpl_ As c_HelloAppHelloInterface
    Set oImpl_ = IIf(oDelegate Is Nothing, Me, oDelegate)
    Select Case sOperation
    Case "_get_integerObj"
        Dim integerObj As c_javalangInteger
        Set integerObj = oImpl_.integerObj()
        Call oOut.writeValue(integerObj)
    Case "_set_integerObj"
        Dim integerObjNew As c_javalangInteger
        Set integerObjNew = oIn.readValue(New c_javalangInteger)
        Set oImpl_.integerObj() = integerObjNew
    Case "_get_char"
        Dim char As Integer
        char = oImpl_.char()
        Call oOut.writeWchar(char)
    Case "_set_char"
        Dim charNew As Integer
        charNew = oIn.readWchar()
        oImpl_.char() = charNew
    Case "_get_bytes"
        Dim bytes As c_ByteSeq
        Set bytes = oImpl_.bytes()
        Call oOut.writeValue(bytes)
    Case "_set_bytes"
        Dim bytesNew As c_ByteSeq
        Set bytesNew = oIn.readValue(New c_ByteSeq)
        Set oImpl_.bytes() = bytesNew
    Case "_get_string"
        Dim stringProp As cCBWStringValue
        Set stringProp = oImpl_.stringProp()
        Call oOut.writeValue(stringProp)
    Case "_set_string"
        Dim stringNew As cCBWStringValue
        Set stringNew = oIn.readValue(New cCBWStringValue)
        Set oImpl_.stringProp() = stringNew
    Case "sayHello"
        Call oImpl_.sayHello
    Case "getHashMap"
        Dim a2_arg0 As Long
        a2_arg0 = oIn.readLong()
        Dim getHashMap As c_javautilHashMap
        Set getHashMap = oImpl_.getHashMap(a2_arg0)
        Call oOut.writeValue(getHashMap)
    Case "setHashMap"
        Dim a3_arg0 As c_javautilHashMap
        Set a3_arg0 = oIn.readValue(New c_javautilHashMap)
        Call oImpl_.setHashMap(a3_arg0)
    Case Else
        Call VBOrb.raiseBADOPERATION(1, VBOrb.CompletedNO, sOperation)
    End Select
    cOrbSkeleton_execute = 0 'NO_EXCEPTION
    Exit Function
ErrHandler:
    Call VBOrb.ErrReraise(Err, "HelloInterface.execute(" & sOperation & ")")
End Function

'Implements c_HelloAppHelloInterface

'attribute integerObj
Private Property Get c_HelloAppHelloInterface_integerObj() As c_javalangInteger
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_HelloAppHelloInterface_integerObj = oDelegate.integerObj
    End If
    Exit Property
ErrHandler:
    Set c_HelloAppHelloInterface_integerObj = Nothing
    Call VBOrb.ErrReraise(Err, "integerObj.Get")
End Property

Private Property Set c_HelloAppHelloInterface_integerObj(ByVal integerObjNew _
    As c_javalangInteger)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set oDelegate.integerObj = integerObjNew
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "integerObj.Set")
End Property

'attribute char
Private Property Get c_HelloAppHelloInterface_char() As Integer
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        c_HelloAppHelloInterface_char = oDelegate.char
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "char.Get")
End Property

Private Property Let c_HelloAppHelloInterface_char(ByVal charNew As Integer)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        oDelegate.char = charNew
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "char.Let")
End Property

'attribute bytes
Private Property Get c_HelloAppHelloInterface_bytes() As c_ByteSeq
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_HelloAppHelloInterface_bytes = oDelegate.bytes
    End If
    Exit Property
ErrHandler:
    Set c_HelloAppHelloInterface_bytes = Nothing
    Call VBOrb.ErrReraise(Err, "bytes.Get")
End Property

Private Property Set c_HelloAppHelloInterface_bytes(ByVal bytesNew As c_ByteSeq)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set oDelegate.bytes = bytesNew
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "bytes.Set")
End Property

'attribute string
Private Property Get c_HelloAppHelloInterface_stringProp() As cCBWStringValue
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_HelloAppHelloInterface_stringProp = oDelegate.stringProp
    End If
    Exit Property
ErrHandler:
    Set c_HelloAppHelloInterface_stringProp = Nothing
    Call VBOrb.ErrReraise(Err, "stringProp.Get")
End Property

Private Property Set c_HelloAppHelloInterface_stringProp(ByVal stringNew _
    As cCBWStringValue)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set oDelegate.stringProp = stringNew
    End If
    Exit Property
ErrHandler:
    Call VBOrb.ErrReraise(Err, "stringProp.Set")
End Property

'sayHello()
Private Sub c_HelloAppHelloInterface_sayHello()
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Call oDelegate.sayHello
    End If
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "sayHello")
End Sub

'getHashMap()
Private Function c_HelloAppHelloInterface_getHashMap(ByVal arg0 As Long) _
    As c_javautilHashMap
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Set c_HelloAppHelloInterface_getHashMap = oDelegate.getHashMap(arg0)
    End If
    Exit Function
ErrHandler:
    Set c_HelloAppHelloInterface_getHashMap = Nothing
    Call VBOrb.ErrReraise(Err, "getHashMap")
End Function

'setHashMap()
Private Sub c_HelloAppHelloInterface_setHashMap(ByVal arg0 As c_javautilHashMap)
    On Error GoTo ErrHandler
    'Please write your own code here if using as servant example
    If oDelegate Is Nothing Then
        Call VBOrb.raiseNOIMPLEMENT(0, VBOrb.CompletedNO)
    Else
        Call oDelegate.setHashMap(arg0)
    End If
    Exit Sub
ErrHandler:
    Call VBOrb.ErrReraise(Err, "setHashMap")
End Sub