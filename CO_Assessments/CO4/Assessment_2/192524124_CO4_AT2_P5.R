# Problem 24 - Network Graph Evaluation

library(DiagrammeR)
library(htmltools)

process_graph <- grViz("
  digraph process {

    graph [
      layout = dot,
      rankdir = LR,
      bgcolor = white,
      margin = 0.2
    ]

    node [
      shape = box,
      style = filled,
      fontname = Arial,
      fontsize = 14,
      color = black,
      width = 1.2,
      height = 0.6
    ]

    edge [
      color = gray40,
      penwidth = 2,
      arrowsize = 0.8
    ]

    Step1 [
      label = 'Step 1',
      fillcolor = '#4563A3',
      fontcolor = white
    ]

    Step2 [
      label = 'Step 2',
      fillcolor = '#F4E285',
      fontcolor = black
    ]

    Step3 [
      label = 'Step 3',
      fillcolor = '#BA5142',
      fontcolor = white
    ]

    Step4 [
      label = 'Step 4',
      fillcolor = '#6A994E',
      fontcolor = white
    ]

    Step1 -> Step2
    Step2 -> Step3
    Step3 -> Step4
  }
")

browsable(
  div(
    style = "
      width: 100%;
      max-width: 950px;
      margin: 0 auto;
      padding: 20px;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
      background-color: white;
    ",
    
    h2(
      "192524124 Problem 24 - Network Graph Evaluation",
      style = "
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        margin: 5px 0 8px 0;
        color: #222222;
      "
    ),
    
    h4(
      "A network graph is unnecessary for a simple linear process",
      style = "
        text-align: center;
        font-size: 14px;
        font-weight: normal;
        margin: 0 0 20px 0;
        color: #555555;
      "
    ),
    
    div(
      style = "
        width: 100%;
        margin: 0 auto 20px auto;
        padding: 5px;
        box-sizing: border-box;
      ",
      process_graph
    ),
    
    div(
      style = "
        width: 90%;
        margin: 10px auto 0 auto;
        padding: 14px 18px;
        border: 1px solid #6A994E;
        background-color: #F2F7F0;
        box-sizing: border-box;
        font-size: 13px;
        line-height: 1.5;
        color: #222222;
      ",
      
      tags$b("Interpretation: "),
      
      "A network graph is not the most appropriate chart type for this process ",
      "because the process contains only a simple linear sequence: ",
      tags$b("Step 1 → Step 2 → Step 3 → Step 4."),
      " There are no branches, cycles, or multiple connections. ",
      "A simple flowchart or process diagram would be more appropriate ",
      "because it communicates the sequential order clearly and with less ",
      "visual complexity."
    )
  )
)