import terminal, os
import strformat

proc prompt(question: string):

    echo &"""
    {question}
    """, ""
    while true:
        case readLine(stdin)
        of
system.addQuitProc(resetAttributes)
