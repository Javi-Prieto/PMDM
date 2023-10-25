import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Agent } from 'src/app/models/agentList.interface';

@Component({
  selector: 'app-agent-item',
  templateUrl: './agent-item.component.html',
  styleUrls: ['./agent-item.component.css']
})
export class AgentItemComponent {
  @Input() agent!: Agent;
  @Output() clickOnAgent = new  EventEmitter<String>();

  
  clickOnDetails(){
    return this.clickOnAgent.emit(this.agent.uuid);
  }

  setButtonColor():string{
    switch(this.agent.role?.displayName){
      case 'Sentinel':
        return 'btn-outline-success';
      case 'Controller':
        return 'btn-outline-primary';
      case 'Duelist':
        return 'btn-outline-danger';
      case 'Initiator':
        return 'btn-outline-warning';
      default:
        return 'btn-outline-secondary';
    }
  }
}
