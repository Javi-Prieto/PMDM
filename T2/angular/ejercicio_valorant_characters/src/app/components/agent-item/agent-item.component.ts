import { Component, Input } from '@angular/core';
import { Agent } from 'src/app/models/agentList.interface';

@Component({
  selector: 'app-agent-item',
  templateUrl: './agent-item.component.html',
  styleUrls: ['./agent-item.component.css']
})
export class AgentItemComponent {
  @Input() agent!: Agent;

  setButtonColor():string{
    switch(this.agent.role?.displayName){
      case 'Sentinel':
        return 'btn-outline-danger';
      default:
        return 'btn-outline-primary';
    }
  }
}
